import 'package:flutter/material.dart';
import 'package:provider_di/core/enums/view_state.dart';
import 'package:provider_di/core/models/comment.dart';
import 'package:provider_di/core/viewmodels/comment_view_model.dart';
import 'package:provider_di/ui/commons/ui_helpers.dart';
import 'package:provider_di/ui/screens/base_screen.dart';

class CommentWidget extends StatelessWidget {
  final int postId;
  const CommentWidget({Key key, this.postId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScreen<CommentViewModel>(
      onModelReady: (model) => model.fetchComments(postId),
      builder: (context, model, child) {
        return model.state == ViewState.BUSY
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Expanded(
                child: ListView(
                  children: model.comments
                      .map(
                        (comment) => CommentItem(
                          comment: comment,
                        ),
                      )
                      .toList(),
                ),
              );
      },
    );
  }
}

class CommentItem extends StatelessWidget {
  final Comment comment;

  const CommentItem({Key key, this.comment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.grey,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            comment.name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          UIHelper.verticalSpaceSmall(),
          Text(comment.body),
        ],
      ),
    );
  }
}
