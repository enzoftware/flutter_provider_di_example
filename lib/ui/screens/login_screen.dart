import 'package:flutter/material.dart';
import 'package:provider_di/core/enums/view_state.dart';
import 'package:provider_di/core/viewmodels/login_view_model.dart';
import 'package:provider_di/ui/commons/app_colors.dart';
import 'package:provider_di/ui/screens/base_screen.dart';
import 'package:provider_di/ui/widgets/login_header.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseScreen<LoginViewModel>(
      builder: (context, model, child) => Scaffold(
        backgroundColor: backgroundColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            LoginHeader(
              validationMessage: model.errorMessage,
              controller: _controller,
            ),
            model.state == ViewState.BUSY
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : FlatButton(
                    color: Colors.white,
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    onPressed: () async {
                      var loginSuccess = await model.login(_controller.text);
                      if (loginSuccess) {
                        Navigator.pushNamed(context, '/');
                      }
                    },
                  )
          ],
        ),
      ),
    );
  }
}
