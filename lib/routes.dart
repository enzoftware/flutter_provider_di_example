import 'package:flutter/material.dart';
import 'package:provider_di/core/models/post.dart';
import 'package:provider_di/ui/screens/home_screen.dart';
import 'package:provider_di/ui/screens/login_screen.dart';
import 'package:provider_di/ui/screens/post_screen.dart';

const String initialRoute = 'login';

class Router {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomeScreen());
        break;
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginScreen());
        break;
      case '/post':
        var post = settings.arguments as Post;
        return MaterialPageRoute(
          builder: (_) => PostScreen(
            post: post,
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text(
                'No route defined',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ),
        );
    }
  }
}
