import 'dart:io';
import '../../helpers/logout.dart';
import '../../models/journal.dart';
import 'package:flutter/material.dart';
import 'widgets/home_screen_list.dart';
import '../commom/exception_dialog.dart';
import '../../service/journal_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // O último dia apresentado na lista
  DateTime currentDay = DateTime.now();

  // Tamanho da lista
  int windowPage = 10;

  // A base de dados mostrada na lista
  Map<String, Journal> database = {};

  final ScrollController _listScrollController = ScrollController();

  JournalService service = JournalService();

  int? userId;

  String? token;

  @override
  void initState() {
    refresh();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Título baseado no dia atual
        title: Text(
          "${currentDay.day}  |  ${currentDay.month}  |  ${currentDay.year}",
        ),
        actions: [
          IconButton(onPressed: () => refresh(), icon: Icon(Icons.refresh))
        ],
      ),
      drawer: Drawer(
        width: MediaQuery.of(context).size.width * 0.6,
        child: ListView(
          children: [
            ListTile(
              leading: Icon(Icons.book),
              title: Text("Minhas notas"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.app_settings_alt),
              title: Text("Sobre o app"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Sair"),
              onTap: () {
                logout(context);
              },
            )
          ],
        ),
      ),
      body: (userId != null && token != null)
          ? ListView(
              controller: _listScrollController,
              children: generateListJournalCards(
                windowPage: windowPage,
                currentDay: currentDay,
                database: database,
                refreshFunction: refresh,
                userId: userId!,
                token: token!,
              ),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  void refresh() async {
    SharedPreferences.getInstance().then((prefs) {
      int? id = prefs.getInt("id")!;
      String? email = prefs.getString("email")!;
      String? accessToken = prefs.getString("accessToken")!;

      if (id != null && email != null && accessToken != null) {
        setState(() {
          userId = id;
          token = accessToken;
        });
        service
            .getAll(id: id.toString(), accessToken: token!)
            .then((List<Journal> listJournals) {
          setState(() {
            database = {};
            for (var journal in listJournals) {
              database[journal.id] = journal;
            }
          });
        });
      } else {
        Navigator.pushReplacementNamed(context, "login");
      }
    }).catchError(
      (error) {
        logout(context);
      },
      test: (error) => error is TokenNotValidException,
    ).catchError(
      (error) {
        showExceptionDialog(context, content: error.message);
      },
      test: (error) => error is HttpException,
    );

  }
}

class TokenNotValidException implements Exception {}
