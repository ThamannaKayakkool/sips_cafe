 part of 'cart_bloc.dart';

sealed class CartEvent  extends Equatable{}

 class AddItemEvent extends CartEvent {
   final int id;
   final String image;
   final String name;
   final double price;
   final int quantity;

  AddItemEvent({required this.id, required this.image, required this.name, required this.price, required this.quantity});

  @override
  List<Object?> get props => [id,image,name,price,quantity];
 }

 class GetCartItemEvent extends CartEvent {
   @override
   List<Object?> get props => [];
 }

 class DeleteItemEvent extends CartEvent {
   final int itemId;

   DeleteItemEvent(this.itemId);

   @override
   List<Object?> get props => [itemId];
 }

 class ClearCartEvent extends CartEvent {
   @override
   List<Object?> get props => [];
 }