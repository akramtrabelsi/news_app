import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:news_app/models/post.dart';
import 'package:news_app/utilities/api_utilities.dart';

class PostsAPI {
  Future<List<Post>> fetchWhatsNew() async {
    String whatsWewApi = base_api + whats_new_api;
    print('-------------');
    var response = await http.get(
      whatsWewApi,
      headers: <String, String>{
        'Accept': 'application/json; charset=UTF-8',
      },
    );
    print('----------res2');
    print(response);
    print('---------------res');

    List<Post> posts = <Post>[];
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      var data = jsonData["data"];
      print(data);
      for (var item in data) {
        Post post = Post(
            id: item['id'].toString(),
            title: item['title'].toString(),
            content: item['content'].toString(),
            dateWritten: item['date_written'].toString(),
            featuredImage: item['featured_image'].toString(),
            votesUp: item['votes_up'],
            votesDown: item['votes_down'],
            votersUp: (item['voters_up'] == null)
                ? <int>[]
                : jsonDecode(item['voters_up']),
            votersDown: (item['voters_down'] == null)
                ? <int>[]
                : jsonDecode(item['voters_down']),
            userId: item['user_id'],
            categoryId: item['category_id']);
        posts.add(post);
      }
      print(data);
    }
    return posts;
  }

  Future<List<Post>> fetchRecentUpdate() async {
    String recentUpdateApi = base_api + recent_update_api;
    print('-------------');
    var response = await http.get(
      recentUpdateApi,
      headers: <String, String>{
        'Accept': 'application/json; charset=UTF-8',
      },
    );
    print('----------res2');
    print(response);
    print('---------------res');

    List<Post> posts = <Post>[];
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      var data = jsonData["data"];
      print(data);
      for (var item in data) {
        Post post = Post(
            id: item['id'].toString(),
            title: item['title'].toString(),
            content: item['content'].toString(),
            dateWritten: item['date_written'].toString(),
            featuredImage: item['featured_image'].toString(),
            votesUp: item['votes_up'],
            votesDown: item['votes_down'],
            votersUp: (item['voters_up'] == null)
                ? <int>[]
                : jsonDecode(item['voters_up']),
            votersDown: (item['voters_down'] == null)
                ? <int>[]
                : jsonDecode(item['voters_down']),
            userId: item['user_id'],
            categoryId: item['category_id']);
        posts.add(post);
      }
      print(data);
    }
    return posts;
  }
}
