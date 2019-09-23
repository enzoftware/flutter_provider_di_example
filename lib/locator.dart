import 'package:get_it/get_it.dart';
import 'package:provider_di/core/services/api.dart';
import 'package:provider_di/core/services/authentication.dart';
import 'package:provider_di/core/viewmodels/comment_view_model.dart';
import 'package:provider_di/core/viewmodels/home_view_model.dart';
import 'package:provider_di/core/viewmodels/login_view_model.dart';

var locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => ApiService());
  locator.registerLazySingleton(() => AuthenticationService());

  locator.registerFactory(() => LoginViewModel());
  locator.registerFactory(() => HomeViewModel());
  locator.registerFactory(() => CommentViewModel());
}
