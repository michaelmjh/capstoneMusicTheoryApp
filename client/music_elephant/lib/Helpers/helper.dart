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

  Future<List<dynamic>?> getUsers() async {
    try {
      var response = await Dio().get('http://localhost:8080/users');
      var json = response.data;
      return json;
    } catch (e) {
      print(e);
    }
  }

  // Future<UserInfo?> updateUser({
  //   required UserInfo userInfo,
  //   required String id,
  // }) async {
  //   UserInfo? updatedUser;

  //   try {
  //     Response response = await Dio().put(
  //       'http://localhost:8080/users/$id',
  //       data: userInfo.toJson(),
  //     );

  //     print('User updated: ${response.data}');

  //     updatedUser = UserInfo.fromJson(response.data);
  //   } catch (e) {
  //     print('Error updating user: $e');
  //   }

  //   return updatedUser;
  // }
}
