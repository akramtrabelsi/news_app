import 'dart:math';

import 'package:flutter/material.dart';

class Favourites extends StatefulWidget {
  @override
  _FavouritesState createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {
  List<Color> colorsList = [
    Colors.red,
    Colors.teal,
    Colors.blue,
    Colors.brown,
    Colors.indigo,
    Colors.blueGrey,
    Colors.deepOrange,
  ];
  Random random = Random();
  Color _getRandomColor() {
    return colorsList[random.nextInt(colorsList.length)];
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, position) {
        return Card(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                _authorRow(),
                SizedBox(
                  height: 16,
                ),
                _newsItemRow(),
              ],
            ),
          ),
        );
      },
      itemCount: 20,
    );
  }

  Widget _authorRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image:
                          ExactAssetImage('assets/images/placeholder_bg.jpg'),
                      fit: BoxFit.cover),
                  shape: BoxShape.circle),
              width: 50,
              height: 50,
              margin: EdgeInsets.only(right: 16),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Micheal Adams',
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Text(
                      ' 15 min ',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      ' life style ',
                      style: TextStyle(color: _getRandomColor()),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
        IconButton(icon: Icon(Icons.bookmark_border), onPressed: () {})
      ],
    );
  }

  Widget _newsItemRow() {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: ExactAssetImage('assets/images/placeholder_bg.jpg'),
            fit: BoxFit.cover,
          )),
          height: 124,
          width: 124,
          margin: EdgeInsets.only(right: 16),
        ),
        Expanded(
          child: Column(
            children: [
              Text(
                'Tech Tent: Old phones and safe social',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'i want to give you some advices about the future and start exchanging some feedbacks in order to improve our skills',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  height: 1.3,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
