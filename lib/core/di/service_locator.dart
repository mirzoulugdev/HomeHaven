import 'package:get_it/get_it.dart';
import '../cache/cache_helper.dart';
import '../../features/auth/data/repositories/auth_repository_impl.dart';
import '../../features/auth/presentation/blocs/bloc/auth_bloc.dart';
import '../../features/home/data/repositories/product_repository_impl.dart';
import '../../features/home/presentation/blocs/Products/product_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  await _initCache();

  _initRepositories();
  _initBlocs();
  _initProductRepository();
}

Future<void> _initCache() async {
  final prefs = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<CacheHelper>(
    () => CacheHelper(preferences: prefs),
  );
}

void _initRepositories() {
  getIt.registerLazySingleton<AuthRepositoryImpl>(
    () => AuthRepositoryImpl(),
  );
}

void _initProductRepository() {
  getIt.registerLazySingleton(
    () => ProductRepositoryImpl(),
  );
}

void _initBlocs() {
  getIt.registerFactory<AuthBloc>(
    () => AuthBloc(
      repo: getIt(),
    ),
  );

  getIt.registerFactory<ProductBloc>(
    () => ProductBloc(
      productRepo: getIt(),
    )..add(FetchProductEvent()),
  );
}
