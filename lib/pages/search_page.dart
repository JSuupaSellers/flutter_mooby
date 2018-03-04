import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  State createState() => new SearchPageState();
}

class SearchPageState extends State<SearchPage> {

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery
        .of(context)
        .size;

    return new Container(
      child: new Scaffold(
        appBar: new AppBar(
          title: new Text('Search'),
        ),
      ),
    );
  }
}