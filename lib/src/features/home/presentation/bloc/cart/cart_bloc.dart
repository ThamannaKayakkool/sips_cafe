import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sips_cafe/src/features/home/data/data_sources/cart_local_data_source.dart';
import 'package:sips_cafe/src/features/home/domain/entities/cart_entity.dart';
import 'package:sips_cafe/src/features/home/domain/use_cases/add_item.dart';
import 'package:sips_cafe/src/features/home/domain/use_cases/delete_item.dart';
import 'package:sips_cafe/src/features/home/domain/use_cases/get_cart_item.dart';

part 'cart_event.dart';

part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc({
    required AddItem addItem,
    required GetCartItem getCartItem,
    required DeleteItem deleteItem,
    required CartLocalDataSourceImpl localDataSourceImpl,
  })  : _addItem = addItem,
        _getCartItem = getCartItem,
        _deleteItem = deleteItem,
        _localDataSourceImpl = localDataSourceImpl,
        super(CartInitial()) {
    cartSubscription = _localDataSourceImpl.cartStream.listen((cartItems) {
      add(GetCartItemEvent());
    });
    on<AddItemEvent>(_addItemHandler);
    on<GetCartItemEvent>(_getCartItemHandler);
    on<DeleteItemEvent>(_deleteItemHandler);
    on<ClearCartEvent>(_clearCartHandler);
  }

  final AddItem _addItem;
  final GetCartItem _getCartItem;
  final DeleteItem _deleteItem;
  final CartLocalDataSourceImpl _localDataSourceImpl;
  StreamSubscription<dynamic>? cartSubscription;

  @override
  Future<void> close() {
    cartSubscription?.cancel();
    return super.close();
  }

  Future<void> _addItemHandler(
      AddItemEvent event, Emitter<CartState> emit) async {
    emit(AddingCart());
    final result = await _addItem(AddItemParams(
        id: event.id,
        name: event.name,
        image: event.image,
        price: event.price,
        quantity: event.quantity));

    result.fold(
      (failure) => emit(CartError(failure.errorMessage)),
      (_) => emit(CartCreated()),
    );
  }

  Future<void> _getCartItemHandler(
      GetCartItemEvent event, Emitter<CartState> emit) async {
    emit(GettingCart());
    final result = await _getCartItem();

    result.fold(
      (failure) => emit(CartError(failure.errorMessage)),
      (items) {
        final subtotal = _calculateSubtotal(items);
        emit(CartLoaded(items, subtotal: subtotal));
      },
    );
  }

  Future<void> _deleteItemHandler(
      DeleteItemEvent event, Emitter<CartState> emit) async {
    emit(DeletingCart());
    final result = await _deleteItem(DeleteItemParams(id: event.itemId));

    result.fold((failure) => emit(CartError(failure.errorMessage)),
        (_) => emit(CartCreated()));
  }

  double _calculateSubtotal(List<CartEntity> items) {
    return items.fold(0, (sum, item) => sum + (item.price * item.quantity));
  }

  Future<void> _clearCartHandler(
      ClearCartEvent event, Emitter<CartState> emit) async {
    emit(CartLoading());
    _localDataSourceImpl.cartBox.removeAll();
    add(GetCartItemEvent());
  }
}
