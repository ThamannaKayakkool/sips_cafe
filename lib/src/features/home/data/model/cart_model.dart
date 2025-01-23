import 'package:objectbox/objectbox.dart';

@Entity()
class CartModel {
  @Id()
  int id = 0;

  String name;
  String image;
  double price;
  int quantity;

  CartModel({
    this.id = 0,
    required this.name,
    required this.image,
    required this.price,
    required this.quantity,
  });
}
