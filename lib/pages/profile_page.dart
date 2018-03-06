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
        child: new DefaultTabController(
          length: choices.length,
          child: new Scaffold(
            appBar: new AppBar(
              bottom: new TabBar(
                  labelStyle: new TextStyle(fontSize: 18.0),
                  isScrollable: true,
                  tabs: choices.map((Choice choice) {
                return new Tab(
                  text: choice.title,
                );
              }).toList()
              ),
            ),
            body: new TabBarView(
              children: choices.map((Choice choice) {
                return new Padding(
                  padding: new EdgeInsets.all(0.0),
                  child: new ChoiceCard(choice: choice),
                );
              }).toList(),
            ),
          ),
        )
    );
  }
}

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({
    Key key, this.choice
  }) : super(key: key);

  final Choice choice;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme
        .of(context)
        .textTheme
        .display1;
    return new Card(
      color: Colors.transparent,
      child: new Center(
        child: new Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Text(choice.title, style: textStyle),
          ],
        ),
      ),
    );
  }
}

class Choice {
  const Choice({
    this.icon, this.title
  });

  final IconData icon;
  final String title;
}

const List<Choice> choices = const<Choice
>[
  const Choice(title: 'Reviews'

  ),
  const Choice(title: 'Comments'

  ),
  const Choice(title: 'About'

  )

];
