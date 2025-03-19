import 'dart:convert';

import 'package:http/http.dart' as http;
import 'http_interceptors.dart';
import 'package:http_interceptor/http/intercepted_client.dart';

class JournalService {
  static const String url = "http://192.168.1.15:3000/";
  static const String resource = "learnhttp/";

  http.Client client =
      InterceptedClient.build(interceptors: [LoggingInterceptor()]);

  String getURI() {
    return "$url$resource";
  }

  void register(String content) {
    client.post(Uri.parse(getURI()), body: json.encode({'content': content}), encoding: AsciiCodec());
  }

  void get() async {
    http.Response response = await client.get(Uri.parse(getURI()));
    print(response.body);
  }
}
