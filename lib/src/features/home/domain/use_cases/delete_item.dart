import 'package:equatable/equatable.dart';
import 'package:sips_cafe/src/core/usecases/usecases.dart';
import 'package:sips_cafe/src/core/utils/typedefs.dart';
import 'package:sips_cafe/src/features/home/domain/repositories/cart_repository.dart';

class DeleteItem
    extends UsecaseWithParams<void, DeleteItemParams> {
  DeleteItem(this._repository);

  final CartRepository _repository;

  @override
  ResultVoid call(DeleteItemParams params) async =>
      _repository.deleteItem(id: params.id);
}

class DeleteItemParams  extends Equatable{
  const DeleteItemParams({
    required this.id,
  });
  final int id;

  @override
  List<Object?> get props => [id];

}
