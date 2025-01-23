import 'package:sips_cafe/src/core/usecases/usecases.dart';
import 'package:sips_cafe/src/core/utils/typedefs.dart';
import 'package:sips_cafe/src/features/home/domain/entities/cart_entity.dart';
import 'package:sips_cafe/src/features/home/domain/repositories/cart_repository.dart';



class GetCartItem extends UsecaseWithoutParams<List<CartEntity>> {
  GetCartItem(this._repository);

  final CartRepository _repository;

  @override
  ResultFuture<List<CartEntity>> call() async => _repository.getCartItem();
}
