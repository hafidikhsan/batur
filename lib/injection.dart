import 'package:batur/bloc/authentification/authentification_bloc.dart';
import 'package:batur/data/repositories/auth_repository_impl.dart';
import 'package:batur/data/services/auth_service.dart';
import 'package:batur/data/sources/auth_remote_source.dart';
import 'package:batur/domain/repositories/auth_repository.dart';
import 'package:batur/domain/usecases/google_auth_usecase.dart';
import 'package:batur/domain/usecases/load_user_usecase.dart';
import 'package:batur/domain/usecases/sign_in_usecase.dart';
import 'package:batur/domain/usecases/sign_out_usecase.dart';
import 'package:batur/domain/usecases/sign_up_usecase.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

Future<void> init() async {
  locator.registerFactory(
    () => AuthService(),
  );

  locator.registerLazySingleton<AuthRemoteSource>(
    () => AuthRemoteDataSourceImpl(
      authService: locator(),
    ),
  );

  locator.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      authRemoteSource: locator(),
    ),
  );

  locator.registerLazySingleton(() => SignInUseCase(locator()));
  locator.registerLazySingleton(() => SignUpUseCase(locator()));
  locator.registerLazySingleton(() => SignOutUseCase(locator()));
  locator.registerLazySingleton(() => LoadUserUseCase(locator()));
  locator.registerLazySingleton(() => GoogleAuthUseCase(locator()));

  locator.registerFactory(
    () => AuthentificationBloc(
      locator(),
    ),
  );
}
