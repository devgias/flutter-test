import 'package:get_it/get_it.dart';

import '../../data/datasources/user_remote_datasource.dart';
import '../../data/repositories/user_repository.dart';
import '../../presentation/cubit/user_cubit.dart';
import '../network/dio_client.dart';

import '../../data/datasources/user_detail_remote_datasource.dart';
import '../../data/repositories/user_detail_repository.dart';
import '../../presentation/cubit/user_detail_cubit.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  // Network
  getIt.registerLazySingleton<DioClient>(
    () => DioClient(),
  );

  // Data source
  getIt.registerLazySingleton<UserRemoteDataSource>(
    () => UserRemoteDataSource(
      getIt<DioClient>().dio,
    ),
  );

  getIt.registerLazySingleton<UserDetailRemoteDataSource>(
    () => UserDetailRemoteDataSource(
      getIt<DioClient>().dio,
    ),
  );

  // Repo
  getIt.registerLazySingleton<UserRepository>(
    () => UserRepository(
      getIt<UserRemoteDataSource>(),
    ),
  );

  getIt.registerLazySingleton<UserDetailRepository>(
    () => UserDetailRepository(
      getIt<UserDetailRemoteDataSource>(),
    ),
  );

  // Cubit
  getIt.registerFactory<UserCubit>(
    () => UserCubit(
      getIt<UserRepository>(),
    ),
  );

  getIt.registerFactory<UserDetailCubit>(
    () => UserDetailCubit(
      getIt<UserDetailRepository>(),
    ),
  );
}
