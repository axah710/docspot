import 'package:dio/dio.dart';
import 'package:docspot/core/networking/api_service.dart';
import 'package:docspot/core/networking/dio_factory.dart';
import 'package:docspot/features/home/data/apis/home_api_service.dart';
import 'package:docspot/features/home/data/repos/home_repo.dart';
import 'package:docspot/features/login/data/repos/login_repo.dart';
import 'package:docspot/features/login/logic/login_cubit/login_cubit.dart';
import 'package:docspot/features/signup/data/repo/signup_repo.dart';
import 'package:docspot/features/signup/logic/cubit/signup_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
// Here, you are creating a singleton instance of GetIt. GetIt.instance ensures
// that there is only one instance of GetIt throughout the application, which
//will be used to register and locate services.
Future<void> setupGetIt() async {
  //Dio & Api Service
  Dio dio = DioFactory.getDio();
  // Here, you obtain a configured Dio instance from DioFactory.
  getIt.registerLazySingleton<ApiService>(
    () => ApiService(dio),
  );
  // This registers ApiService as a lazy singleton. Lazy singleton means that
  // the instance will be created once only when it is first requested.
  // ApiService is initialized with the Dio instance.

  //Login Cubit & Repo
  getIt.registerLazySingleton<LoginRepo>(
    () => LoginRepo(
      getIt(),
    ),
  );
  // This registers LoginRepo as a lazy singleton. It is initialized with an
  // instance of ApiService, which is retrieved from GetIt.
  getIt.registerFactory<LoginCubit>(
    () => LoginCubit(
      getIt(),
    ),
  );
  // This registers LoginCubit as a lazy singleton. It is initialized with an
  // instance of LoginRepo, which is retrieved from GetIt.
  // LoginCubit depends on LoginRepo, so we need to register LoginRepo first.

  // Signup Cubit & Repo
  getIt.registerLazySingleton<SignupRepo>(
    () => SignupRepo(
      getIt(),
    ),
  );
  // getIt.registerLazySingleton<SignupRepo>(() => SignupRepo(getIt()));:
  // Registers SignupRepo as a lazy singleton. It is initialized with an
  // instance of ApiService, which is retrieved from GetIt.
  getIt.registerFactory<SignupCubit>(
    () => SignupCubit(
      getIt(),
    ),
  );
  // getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt()));:
  // Registers SignupCubit as a factory. A new instance of SignupCubit will
  // be created every time it is requested. It is initialized with an instance
  // of SignupRepo, which is retrieved from GetIt.
  getIt.registerLazySingleton<HomeApiService>(
    () => HomeApiService(dio),
  );

  //Home Repo
  getIt.registerLazySingleton<HomeRepo>(
    () => HomeRepo(
      getIt(),
    ),
  );
// Used another way in app router due to we need to register HomeCubit
//  many times..
  // getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt()));
}
// This function is asynchronous and will be used to configure the service
// locator by registering various services and dependencies.
