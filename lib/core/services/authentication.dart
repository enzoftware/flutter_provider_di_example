import 'dart:async';

import 'package:provider_di/core/models/user.dart';
import 'package:provider_di/core/services/api.dart';
import 'package:provider_di/locator.dart';

class AuthenticationService {
  ApiService api = locator<ApiService>();
  StreamController<User> userController = StreamController<User>();

  Future<bool> login(int userId) async {
    var user = await api.getUserProfile(userId);
    user != null ? userController.add(user) : print('null object');
    return user != null;
  }
}
