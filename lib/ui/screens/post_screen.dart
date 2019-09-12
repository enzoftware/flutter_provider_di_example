import 'package:flutter/widgets.dart';
import 'package:provider_di/core/models/post.dart';

class PostScreen extends StatefulWidget {
  final Post post;

  const PostScreen({Key key, this.post}) : super(key: key);
  
  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}