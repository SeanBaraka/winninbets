import 'package:flutter/material.dart';
import 'package:winninbets/constants/colors.dart';
import 'package:winninbets/views/screens/HomeScreen.dart';

import 'views/screens/LoginScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  bool _isAuth;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var token = 'false';
    if(token != null) {
      _isAuth = false;
    }
    return MaterialApp(
      title: 'Winninbets',
      debugShowCheckedModeBanner: false,
      theme:
          ThemeData(primaryColor: clrPrimary,
              scaffoldBackgroundColor: clrBg,
              fontFamily: 'Visby CF',),
      home: _isAuth ? HomeScreen() : LoginScreen(),
    );
  }
}







