import 'package:flutter/material.dart';
import 'package:primeiro_app_flutter/06_bytebank/database/app_database.dart';
import 'package:primeiro_app_flutter/06_bytebank/models/contact.dart';
import '01_banco_douro/banco_douro_app.dart';
import '01_banco_douro/login_page.dart';
import '02_app_cinetopia/app/app.dart';
import '03_marybank/bank.dart';
import '04_bytebank/bytebank_app.dart';
import '05_my_todo_list_/todolist_gamification.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  //runApp(BytebankApp());
  //runApp(const BancoDouroApp());
  //runApp(const CinetopiaApp());
  //runApp(MariBankApp());
  //runApp(BytebankApp());
  runApp(const TodoListGamification());

}