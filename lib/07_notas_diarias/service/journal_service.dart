import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import '../models/journal.dart';
import '../screens/home_screen/home_screen.dart';
import 'http_interceptors.dart';
import 'package:http/http.dart' as http;
import 'package:http_interceptor/http/intercepted_client.dart';

class JournalService {
  static const String url = "http://192.168.1.15:3000/";
  static const String resource = "journals/";

  http.Client client =
      InterceptedClient.build(interceptors: [LoggingInterceptor()]);

  String getURI() {
    return "$url$resource";
  }

  Future<bool> register(Journal content, String accessToken) async {
    String jsonJournal = json.encode(content.toMap());
    http.Response response = await client.post(Uri.parse(getURI()),
        headers: {
          'Content-Type': 'application/json',
          "Authorization": "Bearer $accessToken"
        },
        body: jsonJournal);
    if (response.statusCode != 201) {
      if (json.decode(response.body) == "jwt expired") {
        throw TokenNotValidException();
      }
      throw HttpException(response.body);
    }
    return true;
  }

  Future<bool> edit(String id, Journal content, String accessToken) async {
    String jsonJournal = json.encode(content.toMap());

    http.Response response = await client.put(Uri.parse("${getURI()}$id"),
        headers: {
          'Content-Type': 'application/json',
          "Authorization": "Bearer $accessToken"
        },
        body: jsonJournal);

    if (response.statusCode != 200) {
      if (json.decode(response.body) == "jwt expired") {
        throw TokenNotValidException();
      }
      throw HttpException(response.body);
    } else {
      return true;
    }
  }

  Future<bool> delete({required String id, required String accessToken}) async {
    http.Response response = await client.delete(Uri.parse("${getURI()}$id"),
        headers: {"Authorization": "Bearer $accessToken"});

    if (response.statusCode == 200) {
      if (json.decode(response.body) == "jwt expired") {
        throw TokenNotValidException();
      }
      throw HttpException(response.body);
    } else {
      return true;
    }
  }

  void get() async {
    http.Response response = await client.get(Uri.parse(getURI()));
    log(response.body);
  }

  Future<List<Journal>> getAllOldVersion() async {
    http.Response response = await client.get(Uri.parse(getURI()));

    if (response.statusCode != 200) {
      throw Exception("Erro ao buscar notas diárias");
    }

    List<Journal> journals = [];
    List<dynamic> jsonJournals = json.decode(response.body);

    for (var jsonMap in jsonJournals) {
      journals.add(Journal.fromMap(jsonMap));
    }
    return journals;
  }

  Future<List<Journal>> getAll(
      {required String id, required String accessToken}) async {
    http.Response response = await client
        .get(Uri.parse("${url}users/$id/journals"), headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer $accessToken"
    });

    if (response.statusCode != 200) {
      if (json.decode(response.body) == "jwt expired") {
        throw TokenNotValidException();
      }
      throw HttpException(response.body);
    }

    List<Journal> journals = [];
    List<dynamic> jsonJournals = json.decode(response.body);

    for (var jsonMap in jsonJournals) {
      journals.add(Journal.fromMap(jsonMap));
    }
    return journals;
  }
}
