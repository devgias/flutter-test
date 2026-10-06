// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../features/user/data/datasources/user_local_datasources_impl.dart'
    as _i2;
import '../features/user/data/datasources/user_remote_datasources_impl.dart'
    as _i244;
import '../features/user/data/repositories/user_repositories_impl.dart'
    as _i696;
import '../features/user/domain/usecases/add_user_usecase.dart' as _i513;
import '../features/user/domain/usecases/get_user_detail_usecase.dart' as _i570;
import '../features/user/domain/usecases/get_users_usecase.dart' as _i443;
import '../features/user/domain/usecases/update_user_usecase.dart' as _i483;
import '../features/user/presentation/bloc/user_detail/user_detail_bloc.dart'
    as _i495;
import '../features/user/presentation/bloc/user_form/user_form_bloc.dart'
    as _i267;
import '../features/user/presentation/bloc/users/users_bloc.dart' as _i133;
import '../features/user/user.dart' as _i438;
import '../utils/app_talker.dart' as _i36;
import 'app_env.dart' as _i89;

const String _dev = 'dev';
const String _test = 'test';
const String _prod = 'prod';

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt $initGetIt(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(getIt, environment, environmentFilter);
  gh.lazySingleton<_i438.UserLocalDatasources>(
    () => _i2.UserLocalDatasourcesImpl(),
  );
  gh.lazySingleton<_i89.AppEnv>(
    () => const _i89.AppEnvDev(),
    registerFor: {_dev, _test},
  );
  gh.lazySingleton<_i36.AppTalker>(
    () => _i36.$AppTalkerDev(),
    registerFor: {_dev, _test},
  );
  gh.lazySingleton<_i438.UserRemoteDatasources>(
    () => _i244.UserRemoteDatasourcesImpl(),
  );
  gh.lazySingleton<_i89.AppEnv>(
    () => const _i89.AppEnvProduction(),
    registerFor: {_prod},
  );
  gh.lazySingleton<_i36.AppTalker>(
    () => _i36.$AppTalkerProd(),
    registerFor: {_prod},
  );
  gh.lazySingleton<_i438.UserRepositories>(
    () => _i696.UserRepositoriesImpl(
      gh<_i438.UserRemoteDatasources>(),
      gh<_i438.UserLocalDatasources>(),
    ),
  );
  gh.lazySingleton<_i513.AddUserUseCase>(
    () => _i513.AddUserUseCase(gh<_i438.UserRepositories>()),
  );
  gh.lazySingleton<_i570.GetUserDetailUseCase>(
    () => _i570.GetUserDetailUseCase(gh<_i438.UserRepositories>()),
  );
  gh.lazySingleton<_i443.GetUsersUseCase>(
    () => _i443.GetUsersUseCase(gh<_i438.UserRepositories>()),
  );
  gh.lazySingleton<_i483.UpdateUserUseCase>(
    () => _i483.UpdateUserUseCase(gh<_i438.UserRepositories>()),
  );
  gh.factory<_i495.UserDetailBloc>(
    () => _i495.UserDetailBloc(gh<_i438.GetUserDetailUseCase>()),
  );
  gh.factory<_i133.UsersBloc>(
    () => _i133.UsersBloc(gh<_i438.GetUsersUseCase>()),
  );
  gh.factory<_i267.UserFormBloc>(
    () => _i267.UserFormBloc(
      gh<_i438.AddUserUseCase>(),
      gh<_i438.UpdateUserUseCase>(),
    ),
  );
  return getIt;
}
