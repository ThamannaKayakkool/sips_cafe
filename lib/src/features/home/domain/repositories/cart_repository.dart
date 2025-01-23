import 'package:sips_cafe/src/core/utils/typedefs.dart';
import 'package:sips_cafe/src/features/home/domain/entities/cart_entity.dart';

abstract class CartRepository {
  const CartRepository();

  ResultVoid addItem({
    required int id,
    required String image,
    required String name,
    required double price,
    required int quantity,
});

  ResultFuture<List<CartEntity>> getCartItem();

  ResultVoid deleteItem({required int id});
}
