


import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:soft_bd_skill_test/data/datasource/remote/dio/dio_client.dart';
import 'package:soft_bd_skill_test/data/datasource/remote/dio/logging_interceptor.dart';
import 'package:soft_bd_skill_test/data/repository/page_two_repo.dart';
import 'package:soft_bd_skill_test/utill/app_constants.dart';
import 'package:soft_bd_skill_test/view_model/bottom_navigationbar_viewmodel.dart';
import 'package:soft_bd_skill_test/view_model/page_one_view_model.dart';
import 'package:soft_bd_skill_test/view_model/page_two_view_model.dart';
import 'package:soft_bd_skill_test/view_model/view_all_selected_view_model.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Core
  // sl.registerLazySingleton(() => NetworkInfo(sl()));
  sl.registerLazySingleton(() => DioClient(AppConstants.BASE_URL, sl(), loggingInterceptor: sl(), sharedPreferences: sl()));

  // Repository
  sl.registerLazySingleton(() => PageTwoRepo(dioClient: sl()));


  // Provider
  sl.registerFactory(() => BottomNavigationBarViewModel());
  sl.registerFactory(() => PageTwoViewModel(pageTwoRepo:sl()));
  sl.registerFactory(() => PageOneViewModel());
  sl.registerFactory(() => ViewAllSelectedViewModel());


  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => LoggingInterceptor());
  // sl.registerLazySingleton(() => Connectivity());
}
