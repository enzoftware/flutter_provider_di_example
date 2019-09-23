import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:provider_di/core/models/post.dart';
import 'package:provider_di/core/models/user.dart';
import 'package:provider_di/ui/commons/app_colors.dart' as prefix0;
import 'package:provider_di/ui/commons/text_styles.dart';
import 'package:provider_di/ui/commons/ui_helpers.dart';
import 'package:provider_di/ui/widgets/comment_widget.dart';

class PostScreen extends StatelessWidget {
  final Post post;

  const PostScreen({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: prefix0.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            UIHelper.verticalSpaceLarge(),
            Text(post.title, style: headerStyle),
            Text(
              'by ${Provider.of<User>(context).name}',
              style: TextStyle(fontSize: 9.0),
            ),
            UIHelper.verticalSpaceMedium(),
            Text(post.body),
            CommentWidget(
              postId: post.id,
            ),
          ],
        ),
      ),
    );
  }
}
