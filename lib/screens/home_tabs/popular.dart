import 'package:flutter/material.dart';
import 'package:news_app/api/posts_api.dart';
import 'package:news_app/models/post.dart';
import 'package:news_app/utilities/data_utilities.dart';

class Popular extends StatefulWidget {
  @override
  _PopularState createState() => _PopularState();
}

class _PopularState extends State<Popular> {
  PostsAPI postsAPI = PostsAPI();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: postsAPI.fetchPostsByCategoryId("3"),
      builder: (context, AsyncSnapshot snapShot) {
        switch (snapShot.connectionState) {
          case (ConnectionState.waiting):
            return loading();
            break;
          case (ConnectionState.active):
            return loading();
            break;
          case (ConnectionState.none):
            return connexionError();
            break;
          case (ConnectionState.done):
            if (snapShot.error != null) {
              return error(snapShot.error);
            } else {
              if (snapShot.hasData) {
                List<Post> posts = snapShot.data;
                return ListView.builder(
                  itemCount: 15,
                  itemBuilder: (context, position) {
                    return Card(
                      child: _drawSingleRow(posts[position]),
                    );
                  },
                );
              }
            }
        }
      },
    );
  }

  Widget _drawSingleRow(Post post) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          SizedBox(
            child: Image(
              image: NetworkImage(post.featuredImage),
              fit: BoxFit.cover,
            ),
            height: 120,
            width: 120,
          ),
          SizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              children: [
                Text(
                  post.title,
                  maxLines: 2,
                  style: TextStyle(fontSize: 17),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Micheal Adams',
                      style:
                          TextStyle(fontSize: 12, color: Colors.grey.shade700),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.timer,
                          color: Colors.grey.shade700,
                          size: 22,
                        ),
                        Text(
                          parseHumanDateTime(post.dateWritten),
                          style: TextStyle(color: Colors.grey.shade900),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
