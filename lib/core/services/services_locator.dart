import 'package:get_it/get_it.dart';
import 'package:loccamb/module/auth/domian/use_case/register_usecase.dart';

import '../../module/auth/data/data_source/auth_remote_data_source.dart';
import '../../module/auth/data/repository/auth_repository.dart';
import '../../module/auth/domian/repository/base_auth_repository.dart';
import '../../module/auth/presentation/controller/auth_bloc.dart';

final sl = GetIt.instance;

class ServicesLocator {
  init() {
    ///bloc
    // sl.registerFactory(() => PopularNewsBloc(sl(), sl()));

    // sl.registerFactory(() => SignalBloc(sl()));
    // sl.registerFactory(() => GlobalNewsBloc(sl(), sl()));
    // sl.registerFactory(() => MarketPriceBloc(sl(), sl(), sl()));
    // sl.registerFactory(() => LearningBloc(sl(),sl()));
    // sl.registerFactory(() => LoginBloc(sl()));
    // sl.registerFactory(() => ServiceBloc(sl()));
    //
    // sl.registerFactory(() => WishlistBloc(sl(), sl(), sl(), sl(),sl()));
    //
    // sl.registerFactory(() => RegisterBloc());
    //
    sl.registerLazySingleton<AuthBloc>(() => AuthBloc(sl()));
    // sl.registerLazySingleton<SearchBloc>(() => SearchBloc(sl()));
    //
    //
    // /// useCase
    // sl.registerLazySingleton(() => GetGlobalNewsCategoryUseCase(sl()));
    // sl.registerLazySingleton(() => GetPopularNewsUseCase(sl()));
    // sl.registerLazySingleton(() => GetSignalByDateUseCase(sl()));
    // sl.registerLazySingleton(() => GetGlobalNewsUseCase(sl()));
    // sl.registerLazySingleton(() => GetNewsDetailsUseCase(sl()));
    // sl.registerLazySingleton(() => GetTrendyPriceUseCase(sl()));
    // sl.registerLazySingleton(() => GetLearningUseCase(sl()));
    sl.registerLazySingleton(() => RegisterUseCase(sl()));
    // sl.registerLazySingleton(() => GetMarketWishlistUseCase(sl()));
    // sl.registerLazySingleton(() => GetPostWishlistUseCase(sl()));
    // sl.registerLazySingleton(() => GetLearningWishlistUseCase(sl()));
    // sl.registerLazySingleton(() => AddToWishlistUseCase(sl()));
    // sl.registerLazySingleton(() => GetServicesUseCase(sl()));
    // sl.registerLazySingleton(() => GetMarketPriceCategoryUseCase(sl()));
    // sl.registerLazySingleton(() => GetMarketPriceUseCase(sl()));
    // sl.registerLazySingleton(() => DeleteFromWishlistUseCase(sl()));
    // sl.registerLazySingleton(() => SearchInMarketPriceUseCase(sl()));
    // sl.registerLazySingleton(() => GetLearningCategoryUseCase(sl()));
    //
    //
    //
    //
    // ///repo
    // sl.registerLazySingleton<BaseSignalRepository>(
    //     () => SignalRepository(sl()));
    // sl.registerLazySingleton<BaseGlobalNewsRepository>(
    //     () => GlobalNewsRepository(sl()));
    // sl.registerLazySingleton<BasePopularNewsRepository>(
    //     () => PopularNewsRepository(sl()));
    // sl.registerLazySingleton<BaseMarketPriceRepository>(
    //     () => MarketPriceRepository(sl()));
    // sl.registerLazySingleton<BaseLearningRepository>(
    //     () => LearningRepository(sl()));
    // sl.registerLazySingleton<BaseWishlistRepository>(
    //     () => WishlistRepository(sl()));
    //
    sl.registerLazySingleton<BaseAuthRepository>(() => AuthRepository(sl()));
    // sl.registerLazySingleton<BaseServiceRepository>(
    //     () => ServiceRepository(sl()));
    //
    // ///DataSource
    // sl.registerLazySingleton<BaseSignalRemoteDataSource>(
    //     () => SignalRemoteDataSource());
    // sl.registerLazySingleton<BaseGlobalNewsRemoteDataSource>(
    //     () => GlobalNewsRemoteDataSource());
    // sl.registerLazySingleton<BasePopularNewsRemoteDataSource>(
    //     () => PopularNewsRemoteDataSource());
    // sl.registerLazySingleton<BaseMarketPriceRemoteDataSource>(
    //     () => MarketPriceRemoteDataSource());
    // sl.registerLazySingleton<BaseLearningRemoteDataSource>(
    //     () => LearningRemoteDataSource());
    sl.registerLazySingleton<AuthDataSource>(() => AuthRemoteDataSource());
    // sl.registerLazySingleton<BaseWishlistRemoteDataSource>(
    //     () => WishlistRemoteDataSource());
    // sl.registerLazySingleton<BaseServiceRemoteDataSource>(
    //     () => ServiceRemoteDataSource());
    //
    // //utils
    // sl.registerLazySingleton<ApiHelper>(() => ApiHelper());
    // sl.registerLazySingleton<AuthManager>(() => AuthManager());
    // sl.registerLazySingleton<AppRouter>(() => AppRouter());
  }
}
