import 'package:flutter/material.dart';
import 'package:provider_di/core/models/post.dart';

class PostItem extends StatelessWidget {
  final Post post;
  final Function onTap;

  const PostItem({Key key, this.post, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        
      ),
    );
  }
}