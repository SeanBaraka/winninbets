import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:winninbets/constants/ApiUrl.dart';
import 'package:winninbets/models/AuthToken.dart';
import 'package:winninbets/models/User.dart';
import 'package:winninbets/models/UserLogin.dart';


register(User user) async {
  // register a given user from the User Object supplied. Encode the Object to
  // json and send the json string as a body parameter to the the request to the api
  var response = await http.post("${ApiUrl}users/register/", body: jsonEncode(user)); // attempt to get a response from the server
  return response.statusCode;
}

Future<AuthToken> login(UserLogin userLogin) async {

  var response = await http.post("${ApiUrl}users/login/", body: jsonEncode(userLogin));
  // attempt to login via the api endpoint /login/.

  // If a response status code of 200 is returned, then perform the user logic for decoding the token returned.
  // once the token is decoded, save it to Flutter Secure Storage with the key
  // 'token'
  if(response.statusCode == 200) {
    var authToken = new AuthToken.fromJson(json.decode(response.body)); // decode and save the response body to an
    // instance of AuthToken.

    // TODO: Introduce FSS to save the tokens once authenticated
    return authToken; // I don't know why we have to return the token string, but lets just return it.
  } else {
    return null;
  }
}

Future<dynamic> getUser() async{
  var prefs = await SharedPreferences.getInstance();
  var token = await prefs.get('token');

  var response = await http.get('${ApiUrl}users/profile', headers: {
    'Authorization': 'Bearer $token'
  });
  return json.decode(response.body);

}

Future<dynamic> logout() async {
  var prefs = await SharedPreferences.getInstance();
  var delete = await prefs.remove('token');
  return "deleted";
}