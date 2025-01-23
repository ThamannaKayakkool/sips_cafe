import 'package:get_it/get_it.dart';
import 'package:sips_cafe/src/core/services/service.dart';
import 'package:sips_cafe/src/features/home/data/data_sources/cart_local_data_source.dart';
import 'package:sips_cafe/src/features/home/data/model/cart_model.dart';
import 'package:sips_cafe/src/features/home/data/repositories/cart_repository_impl.dart';
import 'package:sips_cafe/src/features/home/domain/repositories/cart_repository.dart';
import 'package:sips_cafe/src/features/home/domain/use_cases/add_item.dart';
import 'package:sips_cafe/src/features/home/domain/use_cases/delete_item.dart';
import 'package:sips_cafe/src/features/home/domain/use_cases/get_cart_item.dart';
import 'package:sips_cafe/src/features/home/presentation/bloc/cart_bloc.dart';


final sl = GetIt.instance;

Future<void> setup() async {
  final store = await initializeObjectBox();

  sl.registerLazySingleton(() => store.box<CartModel>());


  sl.registerLazySingleton<CartLocalDataSourceImpl>(
        () => CartLocalDataSourceImpl(cartBox: sl()),
  );


  sl.registerLazySingleton<CartLocalDataSource>(
        () => sl<CartLocalDataSourceImpl>(),
  );


  sl.registerLazySingleton<CartRepository>(
        () => CartRepositoryImpl(sl()),
  );


  sl.registerLazySingleton(() => AddItem(sl()));
  sl.registerLazySingleton(() => GetCartItem(sl()));
  sl.registerLazySingleton(() => DeleteItem(sl()));

  sl.registerFactory(() => CartBloc(
    addItem: sl(),
    getCartItem: sl(),
    deleteItem: sl(),
    localDataSourceImpl: sl<CartLocalDataSourceImpl>(),
  ));

}
