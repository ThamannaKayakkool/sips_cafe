import 'package:dartz/dartz.dart';
import 'package:sips_cafe/src/core/error/exception.dart';
import 'package:sips_cafe/src/core/error/failure.dart';
import 'package:sips_cafe/src/core/utils/typedefs.dart';
import 'package:sips_cafe/src/features/home/data/data_sources/cart_local_data_source.dart';
import 'package:sips_cafe/src/features/home/domain/entities/cart_entity.dart';
import 'package:sips_cafe/src/features/home/domain/repositories/cart_repository.dart';

class CartRepositoryImpl implements CartRepository {
  CartRepositoryImpl(this._localDataSource);

  final CartLocalDataSource _localDataSource;

  @override
  ResultVoid addItem({
    required int id,
    required String image,
    required String name,
    required double price,
    required int quantity,
  }) async {
    try {
      await _localDataSource.addItem(
        id: id,
        image: image,
        name: name,
        price: price,
        quantity: quantity,
      );

      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  ResultVoid deleteItem({required int id}) async {
    try {
      await _localDataSource.deleteItem(id: id);
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  ResultFuture<List<CartEntity>> getCartItem() async {
    try {
      final result = await _localDataSource.getCartItem();

      final entityList = result.map((model) {
        return CartEntity(
          id: model.id,
          name: model.name,
          image: model.image,
          price: model.price,
          quantity: model.quantity,
        );
      }).toList();

      return Right(entityList);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }
}
