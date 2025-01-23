import 'package:equatable/equatable.dart';
import 'package:sips_cafe/src/core/usecases/usecases.dart';
import 'package:sips_cafe/src/core/utils/typedefs.dart';
import 'package:sips_cafe/src/features/home/domain/repositories/cart_repository.dart';

class AddItem extends UsecaseWithParams<void, AddItemParams> {
  AddItem(this._repository);

  final CartRepository _repository;

  @override
  ResultVoid call(AddItemParams params) async => _repository.addItem(
      id: params.id,
      image: params.image,
      name: params.name,
      price: params.price,
      quantity: params.quantity);
}

class AddItemParams extends Equatable {
  final int id;
  final String image;
  final String name;
  final double price;
  final int quantity;

  const AddItemParams({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.quantity,
  });

  @override
  List<Object?> get props => [id, image, name, price, quantity];
}

