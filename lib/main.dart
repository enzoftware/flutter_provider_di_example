import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_di/core/models/user.dart';
import 'package:provider_di/core/services/authentication.dart';
import 'package:provider_di/locator.dart';
import 'package:provider_di/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>(
      initialData: User.initial(),
      builder: (context) => locator<AuthenticationService>().userController,
      child: MaterialApp(
        title: 'Provider Architecture Example',
        theme: ThemeData(),
        initialRoute: initialRoute,
        onGenerateRoute: Router.generateRoutes,
      ),
    );
  }
}
