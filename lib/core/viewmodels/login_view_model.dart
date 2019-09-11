import 'package:provider_di/core/enums/view_state.dart';
import 'package:provider_di/core/services/authentication.dart';
import 'package:provider_di/core/viewmodels/base_view_model.dart';
import 'package:provider_di/locator.dart';

class LoginViewModel extends BaseViewModel {
  final AuthenticationService _auth = locator<AuthenticationService>();
  String errorMessage;

  Future<bool> login(String userId) async {
    setState(ViewState.BUSY);
    var success = await _auth.login(int.tryParse(userId));
    setState(ViewState.IDLE);
    if (success)
      return true;
    else {
      errorMessage = "Error inesperado";
      return false;
    }
  }
}
