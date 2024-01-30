import 'package:get_it/get_it.dart';
import 'package:loccamb/module/auth/domian/use_case/login_usecase.dart';
import 'package:loccamb/module/auth/domian/use_case/register_usecase.dart';
import 'package:loccamb/module/home/data/data_source/home_remote_data_source.dart';
import 'package:loccamb/module/home/data/repository/home_repository.dart';
import 'package:loccamb/module/home/domian/repository/base_home_repository.dart';
import 'package:loccamb/module/home/domian/use_case/getusers_usecase.dart';
import 'package:loccamb/module/home/presentation/controller/home_bloc.dart';

import '../../module/auth/data/data_source/auth_remote_data_source.dart';
import '../../module/auth/data/repository/auth_repository.dart';
import '../../module/auth/domian/repository/base_auth_repository.dart';
import '../../module/auth/presentation/controller/auth_bloc.dart';
import '../network/network_service.dart';
import 'package:dio/dio.dart';
final sl = GetIt.instance;

class ServicesLocator {
  init() {
    ///bloc

    sl.registerFactory(()  => AuthBloc(sl(),sl()));
    sl.registerFactory(() => HomeBloc(sl()));

    /// useCase

    sl.registerLazySingleton(() => RegisterUseCase(sl()));
    sl.registerLazySingleton(() => LoginUseCase(sl()));
    sl.registerLazySingleton(() => GetUserUseCase(sl()));

    sl.registerLazySingleton<BaseAuthRepository>(() => AuthRepository(sl()));
    sl.registerLazySingleton<BaseHomeRepository>(() => HomeRepository(sl()));


    sl.registerLazySingleton<AuthDataSource>(() => AuthRemoteDataSource());
    sl.registerLazySingleton<HomeRemoteDataSource>(() => HomeRemoteDataSource(sl()));

    //
    // //utils
     sl.registerFactory(() =>ApiHelper(Dio()));
  }
}
