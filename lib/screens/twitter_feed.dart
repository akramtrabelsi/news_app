import 'package:flutter/material.dart';
import 'package:news_app/shared_ui/navigation_drawer.dart';

class TwitterFeed extends StatefulWidget {
  @override
  _TwitterFeedState createState() => _TwitterFeedState();
}

class _TwitterFeedState extends State<TwitterFeed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Twitter Feed'),
        actions: [IconButton(icon: Icon(Icons.search), onPressed: () {})],
      ),
      drawer: NavigationDrawer(),
      body: ListView.builder(
        padding: EdgeInsets.all(8),
        itemBuilder: (context, position) {
          return Card(
            child: Column(
              children: [
                _cardHeader(),
                _cardBody(),
                _drawLine(),
                _cardFooter(),
              ],
            ),
          );
        },
        itemCount: 20,
      ),
    );
  }

  Widget _cardHeader() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: CircleAvatar(
            backgroundImage:
                ExactAssetImage('assets/images/placeholder_bg.jpg'),
            radius: 24,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text('Christian Meyers',
                    style: TextStyle(
                      color: Colors.grey.shade900,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    )),
                SizedBox(
                  width: 8,
                ),
                Text(
                  '@ch_Meyers',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              'Fri, 12 May 2017 * 14.30',
              style: TextStyle(color: Colors.grey),
            )
          ],
        )
      ],
    );
  }

  Widget _cardBody() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
      child: Text(
        'i want to give you some advices about the future and start exchanging some feedbacks in order to improve our skills',
        style: TextStyle(
          fontSize: 16,
          height: 1.2,
          color: Colors.grey.shade900,
        ),
      ),
    );
  }

  Widget _cardFooter() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(
                icon: Icon(
                  Icons.repeat,
                  size: 28,
                ),
                onPressed: () {},
                color: Colors.orange,
              ),
              Text(
                '25',
                style: TextStyle(color: Colors.grey, fontSize: 16),
              )
            ],
          ),
          Row(
            children: [
              FlatButton(
                  onPressed: () {},
                  child: Text(
                    'SHARE',
                    style: TextStyle(color: Colors.orange),
                  )),
              FlatButton(
                  onPressed: () {},
                  child: Text(
                    'OPEN',
                    style: TextStyle(color: Colors.orange),
                  ))
            ],
          )
        ],
      ),
    );
  }

  Widget _drawLine() {
    return Container(
      height: 1,
      color: Colors.grey.shade200,
      margin: EdgeInsets.only(top: 16),
    );
  }
}
