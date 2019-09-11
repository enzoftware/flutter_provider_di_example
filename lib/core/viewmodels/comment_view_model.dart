import 'package:provider_di/core/enums/view_state.dart';
import 'package:provider_di/core/models/comment.dart';
import 'package:provider_di/core/services/api.dart';
import 'package:provider_di/core/viewmodels/base_view_model.dart';
import 'package:provider_di/locator.dart';

class CommentViewModel extends BaseViewModel {
  ApiService _api = locator<ApiService>();
  List<Comment> comments;

  Future fetchComments(int postId) async {
    setState(ViewState.BUSY);
    comments = await _api.getCommentsForPost(postId);
    setState(ViewState.IDLE);
  }
}