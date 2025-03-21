import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';

import 'http_interceptors.dart';
import 'package:http/http.dart' as http;
import 'package:http_interceptor/http/intercepted_client.dart';

class AuthService {
  static const String url = "http://192.168.1.15:3000/";
  static const String resource = "login/";

  http.Client client =
      InterceptedClient.build(interceptors: [LoggingInterceptor()]);

  Future<bool> login({required String email, required String password}) async {
    http.Response response = await client.post(
      Uri.parse("$url$resource"),
      body: {'email': email, 'password': password},
    );

    if (response.statusCode != 200) {
      String content = json.decode(response.body);
      switch (content) {
        case "Cannot find user":
          throw UserNotFindException();

        case "Invalid password":
          throw InvalidPasswordException();
        default:
          throw HttpException("${response.body}");
      }

    }

    saveUserInfos(response.body);

    return true;
  }

  Future<bool> register({required String email, required String password}) async {
    http.Response response = await client.post(
      Uri.parse("${url}register/"),
      body: {'email': email, 'password': password},
    );

    if (response.statusCode != 201) {
      throw HttpException("${response.body}");
    }

    saveUserInfos(response.body);

    return true;
  }

  saveUserInfos(String body) async {
    Map<String, dynamic> map = json.decode(body);

    String token = map["accessToken"];
    String email = map["user"]["email"];
    int id = map["user"]["id"];
    log("$token\n$email\n$id");

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("accessToken", token);
    prefs.setString("email", email);
    prefs.setInt("id", id);
    log("Shared Salvo com sucesso!");

    String? tokenSalvo = prefs.getString("accessToken")!;
  }
}

class UserNotFindException implements Exception {}

class InvalidPasswordException implements Exception {}
