import 'package:get_it/get_it.dart';
import 'package:provider_di/core/services/api.dart';
import 'package:provider_di/core/services/authentication.dart';

GetIt locator = GetIt.asNewInstance();

void setupLocator(){
  locator.registerLazySingleton(() => ApiService());
  locator.registerLazySingleton(() => AuthenticationService());
}