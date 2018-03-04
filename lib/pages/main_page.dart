import 'package:flutter/material.dart';
import '../ui/bottom_nav_Bar.dart';
import 'profile_page.dart';
import 'search_page.dart';
import 'home_page.dart';

class MainPage extends StatefulWidget {
  @override
  State createState() => new MainPageState();
}

final ThemeData _themeData = new ThemeData(
  primaryColor: const Color(0xFF23272A),
  accentColor: const Color(0xFFBC2025),
  brightness: Brightness.dark,
  scaffoldBackgroundColor: Colors.black,
  canvasColor: const Color(0xFF23272A),       //changes navbar color
);

class MainPageState extends State<MainPage> {

  Map<int, Widget> pages = {0:new HomePage(),1:new SearchPage(),2:new ProfilePage()};
  int pageIndex = 0;

  switchPages(int newIndex){
   this.setState((){
     pageIndex = newIndex;
   });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery
        .of(context)
        .size;

    return new Theme(
      data: _themeData,
      child: new Stack(
        children: <Widget>[
          new Scaffold(
            resizeToAvoidBottomPadding: false,
            body: pages[pageIndex],
            bottomNavigationBar: new BottomNavBar((index) =>
              switchPages(index)
            ),
          )
        ],
      ),
    );
  }

}