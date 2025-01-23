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
  final AddItem addItem;
  final GetCartItem getCartItem;
  final DeleteItem deleteItem;
  final CartLocalDataSourceImpl localDataSourceImpl;

  CartBloc({
    required this.addItem,
    required this.getCartItem,
    required this.deleteItem,
    required this.localDataSourceImpl,
  }) : super(CartInitial()) {
    on<AddItemEvent>(_addItemHandler);
    on<GetCartItemEvent>(_getCartItemHandler);
    on<DeleteItemEvent>(_deleteItemHandler);
    on<ClearCartEvent>(_clearCartHandler);
   // on<SearchEvent>(_searchHandler);
  }

  Future<void> _addItemHandler(
      AddItemEvent event, Emitter<CartState> emit) async {
    emit(CartLoading());
    await addItem(AddItemParams(id: event.id, name: event.name, image: event.image, price: event.price, quantity: event.quantity));
    add(GetCartItemEvent());
  }

  Future<void> _getCartItemHandler(
      GetCartItemEvent event, Emitter<CartState> emit) async {
    emit(CartLoading());
    final result = await getCartItem();

    result.fold(
          (failure) {
        emit(CartInitial());
      },
          (items) {
        final subtotal = _calculateSubtotal(items);
        emit(CartLoaded(items, subtotal: subtotal));
      },
    );
  }

  Future<void> _deleteItemHandler(
      DeleteItemEvent event, Emitter<CartState> emit) async {
    emit(CartLoading());
    await deleteItem(DeleteItemParams(id: event.itemId));
    add(GetCartItemEvent());
  }


  double _calculateSubtotal(List<CartEntity> items) {
    return items.fold(0, (sum, item) => sum + (item.price * item.quantity));
  }

  Future<void> _clearCartHandler(
      ClearCartEvent event, Emitter<CartState> emit) async {
    emit(CartLoading());
    localDataSourceImpl.cartBox.removeAll();
    add(GetCartItemEvent());
  }

}


