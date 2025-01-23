import 'package:sips_cafe/objectbox.g.dart';
import 'package:sips_cafe/src/core/error/exception.dart';
import 'package:sips_cafe/src/features/home/data/model/cart_model.dart';

abstract class CartLocalDataSource {
  Future<void> addItem({
    required int id,
    required String image,
    required String name,
    required double price,
    required int quantity,
  });

  Future<List<CartModel>> getCartItem();

  Future<void> deleteItem({required int id});
}

class CartLocalDataSourceImpl implements CartLocalDataSource {
  final Box<CartModel> cartBox;

  CartLocalDataSourceImpl({required this.cartBox});


  @override
  Future<void> addItem({
    required int id,
    required String image,
    required String name,
    required double price,
    required int quantity}) async {
    try {
      final existingItem = cartBox.query(CartModel_.name.equals(name)).build().findFirst();

      if (existingItem != null) {
        existingItem.quantity += quantity;
        cartBox.put(existingItem);
      } else {
        cartBox.put(CartModel(name: name, image: image, price: price, quantity: quantity));
      }
    } catch (e) {
      throw ServerException(message: e.toString(), statusCode: 505);
    }
  }

  @override
  Future<void> deleteItem({required int id}) async {
    try {
      cartBox.remove(id);
    } catch (e) {
      throw ServerException(message: e.toString(), statusCode: 505);
    }
  }

  @override
  Future<List<CartModel>> getCartItem() async {
    try {
      return cartBox.getAll();
    } catch (e) {
      throw ServerException(message: e.toString(), statusCode: 505);
    }
  }
}

