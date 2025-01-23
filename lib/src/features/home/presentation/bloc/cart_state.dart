part of 'cart_bloc.dart';

abstract class CartState extends Equatable{
  @override
  List<Object?> get props => [];
}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartLoaded extends CartState {
  final List<CartEntity> items;
  final double subtotal;

  CartLoaded(this.items, {this.subtotal = 0});

  @override
  List<Object?> get props => [items,subtotal];
}

