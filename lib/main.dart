import 'package:flutter/material.dart';
import 'package:primeiro_app_flutter/06_bytebank/database/app_database.dart';
import 'package:primeiro_app_flutter/06_bytebank/models/contact.dart';
import '01_banco_douro/banco_douro_app.dart';
import '01_banco_douro/login_page.dart';
import '02_app_cinetopia/app/app.dart';
import '03_marybank/bank.dart';
import '04_bytebank/bytebank_app.dart';
import '05_my_todolist/app_todo_list.dart';
import '07_todo_list_gamification/todolist_gamification.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  //runApp(BytebankApp());
  //runApp(const BancoDouroApp());
  //runApp(const CinetopiaApp());
  //runApp(MariBankApp());
  //runApp(const AppTodoList());
  //runApp(BytebankApp());
  runApp(const TodoListGamification());
}