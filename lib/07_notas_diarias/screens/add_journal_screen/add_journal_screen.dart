import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../helpers/logout.dart';
import '../../service/journal_service.dart';
import 'package:primeiro_app_flutter/07_notas_diarias/helpers/weekday.dart';
import 'package:primeiro_app_flutter/07_notas_diarias/models/journal.dart';

import '../commom/exception_dialog.dart';
import '../home_screen/home_screen.dart';

class AddJournalScreen extends StatelessWidget {
  final Journal journal;
  final bool isEditing;

  AddJournalScreen({super.key, required this.journal, required this.isEditing});
  final TextEditingController _journalController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _journalController.text = journal.content;
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "${WeekDay(journal.createdAt).toString()}, ${journal.createdAt.day}/${journal.createdAt.month} de ${journal.createdAt.year}"),
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
    SharedPreferences.getInstance().then((prefs){
      if(prefs != null){
        String? token= prefs.getString("accessToken");
        if(token != null){
          journal.content = _journalController.text;
          JournalService journalService = JournalService();
          if(isEditing){
            journalService.register(journal, token).then((value) {
              Navigator.pop(context, value);
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
          }else{
            journalService.edit(journal.id, journal, token).then((value) {
              Navigator.pop(context, value);
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
      }
    });
  }
}
