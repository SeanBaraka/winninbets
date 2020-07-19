import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:winninbets/constants/ApiUrl.dart';
import 'package:winninbets/constants/colors.dart';
import 'package:winninbets/controller/AuthController.dart';
import 'package:winninbets/models/User.dart';
import 'package:winninbets/views/components/ButtonRounded.dart';
import 'package:winninbets/views/components/InputBox.dart';
import 'package:winninbets/views/components/InputLabel.dart';
import 'package:winninbets/views/components/LinkLabel.dart';
import 'package:winninbets/views/screens/HomeScreen.dart';
import 'package:winninbets/views/screens/LoginScreen.dart';
import 'package:http/http.dart' as http;

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool checkBoxValue = false;
  String _location, _telephone, _email, _firstname, _lastname, _password, _confirmpass = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
                child: Center(
                  child: Image.asset('assets/images/logo.png'),
                ),
              ),
              Container(
                  padding: EdgeInsets.all(40),
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
                                TextSpan(text: 'Register an account with us\n'),
                              ]
                          ),
                        ),
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      InputLabel(labelText: "Firstname",),
                                      InputBox(changed: (value){
                                          _firstname = value.toString();
                                      }, icon: "assets/icons/ic_user.svg", hint: "firstname", secureText:false)
                                    ],
                                  )
                                ),
                                SizedBox(width: 20,),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      InputLabel(labelText: "Lastname",),
                                      InputBox(changed: (value){
                                        _lastname = value.toString();
                                      }, icon: "assets/icons/ic_user.svg", hint: "lastname", secureText:false)
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 20,),
                            Row(
                              children: <Widget>[
                                Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        InputLabel(labelText: "Location",),
                                        InputBox(changed: (text){
                                            _location = text.toString();
                                        },icon:"assets/icons/ic_user.svg", hint:"Nairobi, Kenya", secureText:false)
                                      ],
                                    )
                                ),
                                SizedBox(width: 20,),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      InputLabel(labelText: "Telephone",),
                                      InputBox(changed: (text){
                                          _telephone = text.toString();
                                      },icon: "assets/icons/ic_user.svg", hint: "+254 712343212", secureText: false)
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 20,),
                            InputLabel(labelText: "Enter your email address"),
                            SizedBox(height: 7,),
                            InputBox(changed: (text){
                                _email = text.toString();
                            }, icon: "assets/icons/ic_user.svg", hint: "example@email.com", secureText: false),
                            SizedBox(height: 20,),
                            Row(
                              children: <Widget>[
                                Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        InputLabel(labelText: "Password",),
                                        InputBox(changed: (value){
                                            _password = value.toString();
                                        }, icon: "assets/icons/ic_lock.svg", hint: "Password",secureText:true)
                                      ],
                                    )
                                ),
                                SizedBox(width: 20,),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      InputLabel(labelText: "Confirm Password",),
                                      InputBox(changed: (text){
                                          _confirmpass = text.toString();
                                      }, icon: "assets/icons/ic_lock.svg", hint: "Confirm", secureText: true)
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 10,),
                            Row(
                              children: <Widget>[
                                Checkbox(
                                  onChanged: (bool newValue) {
                                    setState(() {
                                      checkBoxValue = newValue;
                                    });
                                  },
                                  value: checkBoxValue,
                                  activeColor: clrPrimary,
                                ),
                                Text("I agree to the "),
                                LinkLabel(labelText: "terms and conditions",)
                              ],
                            ),
                            Center(
                              child: ButtonRounded(text: "Sign up", onTap: () async {
                                if(_password == _confirmpass) {
                                  var user = new User(
                                    _firstname,_lastname,_location,_telephone,_email,_password
                                  );

                                  var response = await http.post("${ApiUrl}users/register/", body: jsonEncode(user));
                                  var code = response.statusCode;
                                  if (code == 200) {
                                    return showDialog(
                                        context: context,
                                        barrierDismissible: false,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: Text("Registration Successful", style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w700
                                            ),),
                                            content: SvgPicture.asset('assets/icons/ic_check.svg', width: 40,),
                                            actions: <Widget>[
                                              Container(
                                                child: FlatButton(
                                                  child: Text("Done", style: TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 18,
                                                    color: clrPrimary,
                                                  ),),
                                                  onPressed: (){
                                                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                                                      return LoginScreen();
                                                    }));
                                                  },
                                                  padding: EdgeInsets.all(10),
                                                ),
                                              )
                                            ],
                                          );
                                        }
                                    );
                                  }
                                }
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              },),
                            ),
                            Container(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  Text("Already have an account ?", style: TextStyle(
                                      fontWeight: FontWeight.w700
                                  ),),
                                  SizedBox(width: 10,),
                                  LinkLabel(labelText: "Login instead", press: () {
                                    Navigator.push(context, MaterialPageRoute(
                                        builder: (context) {
                                          return LoginScreen();
                                        }
                                    ));
                                  })
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
