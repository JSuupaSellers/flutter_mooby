import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  State createState() => new ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery
        .of(context)
        .size;

    return new Container(
      child: new Scaffold(
        appBar: new AppBar(
          title: new Text('Profile'),
        ),
      ),
    );
  }
}