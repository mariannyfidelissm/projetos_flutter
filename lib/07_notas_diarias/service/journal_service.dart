import 'dart:convert';
import 'dart:developer';
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

  Future<bool> edit(String id, Journal content) async {
    String jsonJournal = json.encode(content.toMap());

    http.Response response = await client.put(Uri.parse("${getURI()}$id"),
        headers: {'Content-Type': 'application/json'}, body: jsonJournal);

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }


  Future<bool> delete(String id) async {
    http.Response response = await client.delete(Uri.parse("${getURI()}$id"));

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
  void get() async {
    http.Response response = await client.get(Uri.parse(getURI()));
    log(response.body);
  }

  Future<List<Journal>> getAll() async {
    http.Response response = await client.get(Uri.parse(getURI()));

    if(response.statusCode != 200){
      throw Exception("Erro ao buscar notas diárias");
    }

    List<Journal> journals = [];
    List<dynamic> jsonJournals = json.decode(response.body);

    for(var jsonMap in jsonJournals){
      journals.add (Journal.fromMap(jsonMap));
    }
    return journals;
  }
}
