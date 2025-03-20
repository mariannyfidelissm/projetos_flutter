import 'package:flutter/material.dart';
import '../../service/journal_service.dart';
import 'package:primeiro_app_flutter/07_notas_diarias/helpers/weekday.dart';
import 'package:primeiro_app_flutter/07_notas_diarias/models/journal.dart';

class AddJournalScreen extends StatelessWidget {
  final Journal journal;
  AddJournalScreen({super.key, required this.journal});
  final TextEditingController _journalController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "${WeekDay(journal.createdAt.weekday).long}, ${journal.createdAt.day}/${journal.createdAt.month} de ${journal.createdAt.year}"),
        actions: [
          IconButton(
            onPressed: () {
              registerJournal(context);
            },
            icon: Icon(
              Icons.check,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: _journalController,
          keyboardType: TextInputType.multiline,
          style: TextStyle(fontSize: 24),
          expands: true,
          minLines: null,
          maxLines: null,
        ),
      ),
    );
  }

  void registerJournal(BuildContext context) async {
    journal.content = _journalController.text;
    JournalService journalService = JournalService();
    journalService.register(journal).then((value) {
      Navigator.pop(context, value);
    });

  }
}
