import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:winninbets/constants/colors.dart';
import 'package:winninbets/views/screens/HomeScreen.dart';

import 'views/screens/LoginScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  bool _isAuth = false;
  checkToken() async {
    var prefs = await SharedPreferences.getInstance();
    var token = await prefs.get('token');
    if(token != null || token.toString().isNotEmpty) {
      _isAuth = true;
    }
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    checkToken();
    return MaterialApp(
      title: 'Winninbets',
      debugShowCheckedModeBanner: false,
      theme:
          ThemeData(primaryColor: clrPrimary,
              scaffoldBackgroundColor: clrBg,
              fontFamily: 'Visby CF',),
      home: _isAuth == null ? Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ) : _isAuth == true ? HomeScreen() : LoginScreen(),
    );
  }
}







