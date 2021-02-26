import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

Widget error(var error) {
  return Container(
    padding: EdgeInsets.all(16),
    child: Text(error.toString()),
  );
}

Widget noData() {
  return Container(
    padding: EdgeInsets.all(16),
    child: Text('No Data Available'),
  );
}

Widget connexionError() {
  return Container(
    padding: EdgeInsets.all(16),
    child: Text('Connexion Error !!!'),
  );
}

Widget loading() {
  return Container(
    padding: EdgeInsets.only(top: 15, bottom: 16),
    child: Center(
      child: CircularProgressIndicator(),
    ),
  );
}

String parseHumanDateTime(String dateTime) {
  Duration timeAgo = DateTime.now().difference(DateTime.parse(dateTime));
  DateTime theDifference = DateTime.now().subtract(timeAgo);
  return timeago.format(theDifference);
}
