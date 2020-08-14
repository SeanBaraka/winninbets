import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:winninbets/constants/ApiUrl.dart';
import 'package:winninbets/constants/colors.dart';
import 'package:winninbets/controller/AuthController.dart';
import 'package:winninbets/models/AuthToken.dart';
import 'package:winninbets/models/UserLogin.dart';
import 'package:winninbets/views/components/ButtonRounded.dart';
import 'package:winninbets/views/components/InputBox.dart';
import 'package:winninbets/views/components/InputLabel.dart';
import 'package:winninbets/views/components/LinkLabel.dart';
import 'package:winninbets/views/screens/RegisterScreen.dart';
import 'package:http/http.dart' as http;

import 'HomeScreen.dart';

class LoginScreen extends StatefulWidget {

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var _isLoading = false;
  var errorMessage = '';
  var _incorrectLogin = false;

  var _email, _password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading ? Center(child: CircularProgressIndicator(strokeWidth: 2,),) : Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.15),
                child: Center(
                  child: Image.asset('assets/images/logo.png'),
                ),
              ),
              Container(
                  padding: EdgeInsets.all(50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: RichText(
                          text: TextSpan(
                              style: TextStyle(
                                  fontSize: 26,
                                  color: clrPrimary,
                                  fontFamily: 'Visby CF',
                                  decoration: TextDecoration.none,
                                  fontWeight: FontWeight.w700
                              ),
                              children: <TextSpan>[
                                TextSpan(text: 'Hello,\n'),
                                TextSpan(text: 'login to proceed')
                              ]
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            _incorrectLogin ? Container(
                              child: Text("Invalid Login credentials. Try again", style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.redAccent,
                                  fontSize: 16
                              ),),
                              padding: EdgeInsets.only(top: 10, bottom: 10),
                              width: MediaQuery.of(context).size.width,
                            ) : Container(),
                            SizedBox(height: 10,),
                            InputLabel(labelText: "Enter your email address here"),
                            SizedBox(height: 7,),
                            InputBox(changed: (text){
                                _email = text.toString();
                            }, icon: "assets/icons/ic_user.svg",hint: "example@email.com", secureText:false),
                            SizedBox(height: 20,),
                            InputLabel(labelText: "Enter your password",),
                            SizedBox(height: 7,),
                            InputBox(changed: (text){
                                _password = text.toString();
                            }, icon:"assets/icons/ic_lock.svg",hint:"Password", secureText:true),
                            SizedBox(height: 10,),
                            LinkLabel(labelText: "Forgot password ?"),
                            Center(
                              child: ButtonRounded(text: "Login", onTap: () async{
                                setState(() {
                                  _isLoading = true;
                                });
                                var userToLogin = new UserLogin(_email, _password);
                                var loginResponse = await http.post('${ApiUrl}users/login/', body: json.encode(userToLogin));
                                if(loginResponse.statusCode == 200) {
                                  var authToken = new AuthToken.fromJson(json.decode(loginResponse.body));

                                  SharedPreferences prefs = await SharedPreferences.getInstance();
                                  await prefs.setString('token', authToken.token);
                                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                                    builder: (context){
                                      return HomeScreen();  
                                    }
                                  ), (Route<dynamic> route) => false);
                                } else if(loginResponse.statusCode == 404) {
                                  setState(() {
                                    _isLoading = false;
                                    _incorrectLogin = true;
                                  });
                                }
                              },),
                            ),
                            Container(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  Expanded(
                                    child: Text("Don't yet have an account ?", style: TextStyle(
                                      fontWeight: FontWeight.w700
                                    ),),
                                  ),
                                  SizedBox(width: 10,),
                                  Expanded(
                                    child: LinkLabel(labelText: "Register here", press: () {
                                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                                        builder: (context) {
                                          return RegisterScreen();
                                        }
                                      ), (Route<dynamic> route) => false);
                                    }),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}

