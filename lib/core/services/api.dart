import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:provider_di/core/models/comment.dart';
import 'package:provider_di/core/models/post.dart';
import 'package:provider_di/core/models/user.dart';

class ApiService {
  static const endpoint = 'https://jsonplaceholder.typicode.com';
  var client = http.Client();


  Future<User> getUserProfile(int userId) async {
    var response =await client.get('$endpoint/users/$userId');
    return User.fromJson(json.decode(response.body));
  }

  Future<List<Post>> getPostForUser(int userId) async {
    var posts = List<Post>();
    var response = await client.get('$endpoint/posts?userId=$userId');
    var parsed = json.decode(response.body) as List<dynamic>;
    for (var post in parsed){
      posts.add(Post.fromJson(post));
    }
    return posts;
  }

  Future<List<Comment>> getCommentsForPost(int postId) async {
    var comments = List<Comment>();
    var response = await client.get('$endpoint/comments?postId=$postId');
    var parsed = json.decode(response.body) as List<dynamic>;
    for (var comment in parsed){
      comments.add(comment);
    }
    return comments;
  }
}
