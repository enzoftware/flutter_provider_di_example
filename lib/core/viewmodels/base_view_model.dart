import 'package:flutter/widgets.dart';
import 'package:provider_di/core/enums/view_state.dart';

class BaseViewModel extends ChangeNotifier {

  ViewState _state = ViewState.IDLE;

  ViewState get state => _state;

  void setState(ViewState viewState){
    _state = viewState;
    notifyListeners();
  }

}