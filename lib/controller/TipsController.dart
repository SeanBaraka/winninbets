import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:winninbets/constants/ApiUrl.dart';
import 'package:winninbets/models/Prediction.dart';


//Get Todays Tips: TODO: filter by date

Future<List<dynamic>> getTips() async {
  var response = await http.get('${ApiUrl}tips');
  if(response.statusCode == 200) {
    final items = json.decode(response.body).cast<Map<String, dynamic>>();
    List<dynamic> tips = items.map((json) {
      return json['fields'];
    }).toList();
    return tips;
  } else {
    return null;
  }
}

// Get all tips
Future<List<dynamic>> getRecent() async {
  var response = await http.get('${ApiUrl}tips/recent');
  if(response.statusCode == 200) {
    final items = json.decode(response.body).cast<Map<String, dynamic>>();
    List<dynamic> tips = items.map((json) {
      return json['fields'];
    }).toList();
    return tips;
  } else {
    return null;
  }
}

Future<List<dynamic>> getFeatured() async {
  var response = await http.get('${ApiUrl}tips/featured');
  if(response.statusCode == 200) {
    final items = json.decode(response.body).cast<Map<String, dynamic>>();
    List<dynamic> tips = items.map((json) {
      return json['fields'];
    }).toList();
    return tips;
  } else {
    return null;
  }
}