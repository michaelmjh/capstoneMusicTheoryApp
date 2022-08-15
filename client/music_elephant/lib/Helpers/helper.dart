import 'dart:convert';
import 'dart:async';
import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../LessonAssets/lesson2.dart';

class Helper {
  Future<List<dynamic>?> getLessons() async {
    // var client = http.Client();

    // var uri = Uri.parse('http://localhost:8080/lessons');
    // var response = await client.get(uri);
    // if (response.statusCode == 200) {
    //   var json = response.body;
    //   lesson2FromJson(json);
    // }
    try {
      var response = await Dio().get('http://localhost:8080/lessons');
      var json = response.data;
      return json;
      // print(json);

      // lesson2FromJson(json);
    } catch (e) {
      print(e);
    }
  }
}
