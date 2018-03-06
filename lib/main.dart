import 'package:flutter/material.dart';
import 'pages/login_page.dart';
import 'pages/main_page.dart';
void main(){
  runApp(new MaterialApp(
    home: new LoginPage(),
  routes: {
      "/main_page": (_) => new MainPage(),
  },
  ));
}