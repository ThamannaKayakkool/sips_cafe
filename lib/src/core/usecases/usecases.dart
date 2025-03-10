import 'package:sips_cafe/src/core/utils/typedefs.dart';

abstract class UsecaseWithParams<Type,Params>{
  const UsecaseWithParams();
  ResultFuture<Type> call(Params params);
}
abstract class UsecaseWithoutParams<Type>{
  const UsecaseWithoutParams();
  ResultFuture<Type> call();
}


