import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget{

  BottomNavBar(this._onTap);

  ValueChanged<int> _onTap;
  @override
  State createState() => new BottomNavBarState();
}

class BottomNavBarState extends State<BottomNavBar>{

  int index = 0;

  void changePageandIndex(int newIndex){
    this.setState(() {
      index = newIndex;
    });
    widget._onTap(newIndex);
  }
  List<BottomNavigationBarItem> buildNavbar(){
    List<BottomNavigationBarItem> items = new List<BottomNavigationBarItem>();
    items.add(new BottomNavigationBarItem(icon: new Icon(Icons.home), title: new Text('Home')));
    items.add(new BottomNavigationBarItem(icon: new Icon(Icons.search), title: new Text('Search')));
    items.add(new BottomNavigationBarItem(icon: new Icon(Icons.account_circle), title: new Text('Profile')));
    return items;
  }

  @override
  Widget build(BuildContext context){
    return new BottomNavigationBar(
      fixedColor: const Color(0xFFBC2025),
      items: buildNavbar(),
      currentIndex: index,
      onTap: (newIndex) =>
        changePageandIndex(newIndex)
      ,
    );
  }
}