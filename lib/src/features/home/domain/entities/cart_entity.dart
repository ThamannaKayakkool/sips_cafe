import 'package:equatable/equatable.dart';

class CartEntity extends Equatable{
  final int id;
  final String image;
  final String name;
  final double price;
  final int quantity;

  const CartEntity({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.quantity,
  });

  @override
  List<Object?> get props => [id,image,name,price,quantity];
}
