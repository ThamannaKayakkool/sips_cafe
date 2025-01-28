part of 'cart_bloc.dart';

sealed class CartState extends Equatable{
  @override
  List<Object?> get props => [];
}

 class CartInitial extends CartState {}

 class CartLoading extends CartState {}

class AddingCart extends CartState {
 AddingCart();
}
class GettingCart extends CartState {
  GettingCart();
}
class DeletingCart extends CartState {
  DeletingCart();
}

class CartCreated extends CartState {
  CartCreated();
}

class CartLoaded extends CartState {
  final List<CartEntity> items;
  final double subtotal;

  CartLoaded(this.items, {this.subtotal = 0});

  @override
  List<Object?> get props => [items,subtotal];
}

 class CartError extends CartState {
  final String errorMessage;

  CartError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

