import 'package:flutter_nur_assignment/api/api-service.dart';
import 'package:flutter_nur_assignment/api/http-service.dart';
import 'package:flutter_nur_assignment/utils/sp-utils.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async{

  locator.registerLazySingleton<SPUtil>(() => SPUtil());
  locator.registerLazySingleton<HttpService>(() => HttpService());
  locator.registerLazySingleton<ApiService>(() => ApiService());
}