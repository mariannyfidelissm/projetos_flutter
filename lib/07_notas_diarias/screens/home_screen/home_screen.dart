import 'package:flutter/material.dart';
import 'package:primeiro_app_flutter/07_notas_diarias/service/journal_service.dart';
import '../../models/journal.dart';
import '../../database/database.dart';
import 'widgets/home_screen_list.dart';

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
      body: ListView(
        controller: _listScrollController,
        children: generateListJournalCards(
          windowPage: windowPage,
          currentDay: currentDay,
          database: database,
          refreshFunction: refresh,
        ),
      ),
    );
  }

  void refresh() async {
    List<Journal> listJournals = await service.getAll();
    setState(() {
      database = {};
      for (var journal in listJournals) {
        database[journal.id] = journal;
      }
    });
  }
}
