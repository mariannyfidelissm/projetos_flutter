import 'dart:io';
import 'dart:convert';
import 'dart:developer';
import 'web_client.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  String url = WebClient.url;
  http.Client client = WebClient().client;
  static const String resource = "login/";
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
          throw HttpException(response.body);
      }
    }

    saveUserInfos(response.body);

    return true;
  }

  Future<bool> register(
      {required String email, required String password}) async {
    http.Response response = await client.post(
      Uri.parse("${url}register/"),
      body: {'email': email, 'password': password},
    );

    if (response.statusCode != 201) {
      throw HttpException(response.body);
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
