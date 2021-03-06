import 'package:flutter/material.dart';
import 'package:news_app/api/posts_api.dart';

import 'package:news_app/models/post.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:news_app/utilities/data_utilities.dart';

class WhatsNews extends StatefulWidget {
  @override
  _WhatsNewsState createState() => _WhatsNewsState();
}

class _WhatsNewsState extends State<WhatsNews> {
  PostsAPI postsAPI = PostsAPI();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _drawHeader(),
          _drawTopStories(),
          _drawRecentUpdate(),
        ],
      ),
    );
  }

  Widget _drawTopStories() {
    return Container(
      color: Colors.grey.shade100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 16),
            child: _drawSectionTitle(
              'Top Stories',
            ),
          ),
          Padding(
            padding: EdgeInsets.all(12),
            child: Card(
              child: FutureBuilder(
                future: postsAPI.fetchPostsByCategoryId("1"),
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
                          if (posts.length >= 3) {
                            Post post1 = snapShot.data[0];
                            Post post2 = snapShot.data[1];
                            Post post3 = snapShot.data[2];
                            return Column(
                              children: <Widget>[
                                _drawSingleRow(post1),
                                _drawDivider(),
                                _drawSingleRow(post2),
                                _drawDivider(),
                                _drawSingleRow(post3),
                              ],
                            );
                          } else {
                            return noData();
                          }
                        } else {
                          return noData();
                        }
                      }
                      break;
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _drawRecentUpdate() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: FutureBuilder(
          future: postsAPI.fetchPostsByCategoryId("2"),
          builder: (context, snapShot) {
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
                if (snapShot.hasError) {
                  return error(snapShot.error);
                } else {
                  if (snapShot.hasData) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 16, bottom: 8, top: 8),
                          child: _drawSectionTitle('Recent Update'),
                        ),
                        _drawRecentUpdateCard(
                            Colors.deepOrange, snapShot.data[0]),
                        _drawRecentUpdateCard(Colors.teal, snapShot.data[1]),
                        SizedBox(
                          height: 48,
                        )
                      ],
                    );
                  } else {
                    return noData();
                  }
                }
            }
          }),
    );
  }

  Widget _drawSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
          color: Colors.grey.shade700,
          fontWeight: FontWeight.w600,
          fontSize: 16),
    );
  }

  _drawRecentUpdateCard(Color color, Post post) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(post.featuredImage),
                    fit: BoxFit.cover)),
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.25,
          ),
          Padding(
            padding: EdgeInsets.only(top: 16, bottom: 8, left: 16),
            child: Container(
              padding: EdgeInsets.only(left: 24, right: 24, top: 2, bottom: 2),
              decoration: BoxDecoration(
                  color: color, borderRadius: BorderRadius.circular(4)),
              child: Text(
                'SPORT',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 8),
            child: Text(
              post.title,
              style: TextStyle(fontSize: 16),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 8),
            child: Row(
              children: [
                Icon(
                  Icons.timer,
                  color: Colors.grey,
                  size: 19,
                ),
                Text(
                  parseHumanDateTime(post.dateWritten),
                  style: TextStyle(color: Colors.grey, fontSize: 13),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _drawDivider() {
    return Container(
      height: 1,
      width: double.infinity,
      color: Colors.grey.shade100,
    );
  }

  Widget _drawSingleRow(Post post) {
    return post.featuredImage == null
        ? Container()
        : Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                SizedBox(
                  child: Image.network(
                    post.featuredImage,
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
                            style: TextStyle(
                                fontSize: 12, color: Colors.grey.shade700),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.timer,
                                color: Colors.grey.shade700,
                                size: 20,
                              ),
                              Text(
                                parseHumanDateTime(post.dateWritten),
                                style: TextStyle(
                                    color: Colors.grey.shade900, fontSize: 12),
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

  Widget _drawHeader() {
    TextStyle _headerTitle = TextStyle(
        color: Colors.white, fontWeight: FontWeight.w600, fontSize: 22);
    TextStyle _headerDescription = TextStyle(color: Colors.white, fontSize: 18);
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.25,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: ExactAssetImage('assets/images/placeholder_bg.jpg'),
              fit: BoxFit.cover)),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 48, right: 48),
              child: Text(
                'How terries & Get overcomee bold',
                style: _headerTitle,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 34, right: 34),
              child: Text(
                  'lorem ipsum dolor shield und heizen bergen den wangern,sed tutuen',
                  style: _headerDescription,
                  textAlign: TextAlign.center),
            )
          ],
        ),
      ),
    );
  }
}
