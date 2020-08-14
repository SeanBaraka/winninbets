import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:winninbets/constants/colors.dart';
import 'package:winninbets/views/screens/HomeScreen.dart';

import 'views/screens/LoginScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static bool _isAuth = false;

  Future<void> checkToken() async {
    var prefs = await SharedPreferences.getInstance();
    var token = await prefs.get('token');
    if(token != null && token.toString().isNotEmpty) {
      print('token $token');
     setState(() {
       _isAuth = true;
     });
    } else {
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context) => LoginScreen()), (Route<dynamic> route) => false);
      return false;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    checkToken();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Winninbets',
      debugShowCheckedModeBanner: false,
      theme:
          ThemeData(primaryColor: clrPrimary,
              scaffoldBackgroundColor: clrBg,
              fontFamily: 'Visby CF',),
      home: _isAuth == true ? HomeScreen() : LoginScreen(),
    );
  }
}







