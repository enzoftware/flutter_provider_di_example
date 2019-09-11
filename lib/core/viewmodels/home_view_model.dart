import 'package:provider_di/core/enums/view_state.dart';
import 'package:provider_di/core/models/post.dart';
import 'package:provider_di/core/services/api.dart';
import 'package:provider_di/core/viewmodels/base_view_model.dart';
import 'package:provider_di/locator.dart';

class HomeViewModel extends BaseViewModel {
  ApiService _api = locator<ApiService>();

  List<Post> posts;

  Future getPosts(int userId) async {
    setState(ViewState.BUSY);
    posts = await _api.getPostForUser(userId);
    setState(ViewState.IDLE);
  }
}
