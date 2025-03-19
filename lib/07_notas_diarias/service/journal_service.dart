import 'dart:convert';
import '../models/journal.dart';
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

  Future<bool> register(Journal content) async {
    String jsonJournal = json.encode(content.toMap());
    http.Response response = await client.post(Uri.parse(getURI()),
        headers: {'Content-Type': 'application/json'}, body: jsonJournal);
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  void get() async {
    http.Response response = await client.get(Uri.parse(getURI()));
    print(response.body);
  }
}
