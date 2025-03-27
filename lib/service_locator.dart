import 'package:get_it/get_it.dart';
import 'package:user/core/data/remote/dio_helper.dart';
import 'package:user/core/manager/cubit.dart';
import 'package:user/utils/helpers/cache_helper.dart';


final sl = GetIt.instance;

class ServiceLocator {
  static void init() {
    ///Helper

    sl.registerLazySingleton(() => DioHelper());
    sl.registerLazySingleton(() => CacheHelper());

    ///cubits
    // sl.registerFactory(
    //         () => HomeCubit(sl<GetBannersUseCase>()));


    ///Authentication

    //use case


    ///Home
    //use case

    // sl.registerLazySingleton(
    //         () => GetBannersUseCase(baseHomeRepositories: sl<HomeRepositories>()));
    // //Repositories
    //
    // sl.registerLazySingleton<HomeRepositories>(() => HomeRepositories(
    //     baseHomeRemoteDataSource: sl<BaseHomeRemoteDataSource>()));
    //
    // //data source
    //
    // sl.registerLazySingleton<BaseHomeRemoteDataSource>(
    //         () => HomeRemoteDataSource());

    ///Services
    //use case


    ///Map
    // sl.registerLazySingleton(() => MapRepo());
  }
}
