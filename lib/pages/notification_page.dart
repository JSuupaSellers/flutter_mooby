import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  @override
  State createState() => new NotificationPageState();
}

class NotificationPageState extends State<NotificationPage> {

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery
        .of(context)
        .size;

    return new Container(
      child: new Scaffold(
        appBar: new AppBar(
          title: new Text('Notifications'),
        ),
      ),
    );
  }
}