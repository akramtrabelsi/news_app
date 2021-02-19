import 'package:flutter/material.dart';

class Popular extends StatefulWidget {
  @override
  _PopularState createState() => _PopularState();
}

class _PopularState extends State<Popular> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, position) {
        return Card(
          child: _drawSingleRow(),
        );
      },
      itemCount: 20,
    );
  }

  Widget _drawSingleRow() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          SizedBox(
            child: Image(
              image: ExactAssetImage('assets/images/placeholder_bg.jpg'),
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
                  'The World Global Warming Global Summit',
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
                          '15 min',
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
