import 'dart:async';
import 'package:dio/dio.dart';

class Helper {
  Future<List<dynamic>?> getLessons() async {
    try {
      var response = await Dio().get('http://localhost:8080/lessons');
      var json = response.data;
      return json;
    } catch (e) {
      print(e);
    }
  }

  Future<List<dynamic>?> getAllQuestions() async {
    try {
      var response = await Dio().get('http://localhost:8080/questions');
      var json = response.data;
      return json;
    } catch (e) {
      print(e);
    }
  }

  Future<List<dynamic>?> getScales1Questions() async {
    try {
      var response =
          await Dio().get('http://localhost:8080/questions?lessonName=SCALES1');
      var json = response.data;
      return json;
    } catch (e) {
      print(e);
    }
  }
}
