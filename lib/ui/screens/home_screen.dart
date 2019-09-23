import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_di/core/enums/view_state.dart';
import 'package:provider_di/core/models/post.dart';
import 'package:provider_di/core/models/user.dart';
import 'package:provider_di/core/viewmodels/home_view_model.dart';
import 'package:provider_di/ui/commons/app_colors.dart';
import 'package:provider_di/ui/commons/text_styles.dart';
import 'package:provider_di/ui/commons/ui_helpers.dart';
import 'package:provider_di/ui/screens/base_screen.dart';
import 'package:provider_di/ui/widgets/post_list_item.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseScreen<HomeViewModel>(
      onModelReady: (viewModel) =>
          viewModel.getPosts(Provider.of<User>(context).id),
      builder: (context, model, child) => Scaffold(
        backgroundColor: backgroundColor,
        body: model.state == ViewState.BUSY
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  UIHelper.verticalSpaceLarge(),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      'Welcome ${Provider.of<User>(context).name}',
                      style: headerStyle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child:
                        Text('Here are all your posts', style: subHeaderStyle),
                  ),
                  UIHelper.verticalSpaceSmall(),
                  Expanded(
                    child: getPostsUi(
                      model.posts,
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Widget getPostsUi(List<Post> posts) => ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) => PostItem(
          post: posts[index],
          onTap: () => Navigator.pushNamed(
            context,
            '/post',
            arguments: posts[index],
          ),
        ),
      );
}
