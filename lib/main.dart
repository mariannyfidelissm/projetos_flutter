import 'package:flutter/material.dart';
import 'package:primeiro_app_flutter/06_bytebank/database/app_database.dart';
import 'package:primeiro_app_flutter/06_bytebank/models/contact.dart';
import 'package:primeiro_app_flutter/07_notas_diarias/models/journal.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '01_banco_douro/banco_douro_app.dart';
import '01_banco_douro/login_page.dart';
import '02_app_cinetopia/app/app.dart';
import '03_marybank/bank.dart';
import '04_bytebank/bytebank_app.dart';
import '05_my_todo_list_/todolist_gamification.dart';
import '07_notas_diarias/note_diary_app.dart';
import '07_notas_diarias/service/journal_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //runApp(BytebankApp());
  //runApp(const BancoDouroApp());
  //runApp(const CinetopiaApp());
  //runApp(MariBankApp());
  //runApp(BytebankApp());
  //runApp(const TodoListGamification());
  {
    bool isLogged = await verifyToken();
    runApp(NoteDiaryApp(
      isLogged: isLogged,
    ));

    JournalService journalService = JournalService();
    //journalService.register(Journal.empty());
    //journalService.getAll();
  }
}

Future<bool> verifyToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString("accessToken");
  if (token != null) {
    return true;
  } else {
    return false;
  }
}
