import 'http_interceptors.dart';
import 'package:http/http.dart' as http;
import 'package:http_interceptor/http/intercepted_client.dart';

class WebClient {
  static const String url = "http://192.168.1.15:3000/";

  http.Client client = InterceptedClient.build(
    interceptors: [LoggingInterceptor()],
    requestTimeout: Duration(seconds: 5),
  );
}
