import 'package:flutter/material.dart';
import 'models/journal.dart';
import 'screens/home_screen/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/login_screen/login_screen.dart';
import 'screens/add_journal_screen/add_journal_screen.dart';

class NoteDiaryApp extends StatelessWidget {
  final bool isLogged;

  const NoteDiaryApp({super.key, required this.isLogged});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Simple Journal',
        debugShowCheckedModeBanner: false,
        darkTheme: ThemeData.dark(),
        themeMode: ThemeMode.light,
        theme: ThemeData(
          primarySwatch: Colors.grey,
          appBarTheme: const AppBarTheme(
            elevation: 1,
            backgroundColor: Colors.black,
            titleTextStyle: TextStyle(color: Colors.white),
            actionsIconTheme: IconThemeData(color: Colors.white),
            iconTheme: IconThemeData(color: Colors.white),
          ),
          textTheme: GoogleFonts.bitterTextTheme(),
        ),
        initialRoute: (isLogged) ? "home" : "login",
        routes: {
          "home": (context) => const HomeScreen(),
          "login": (context) => LoginScreen(),
        },
        onGenerateRoute: (settings){
          if (settings.name == "add-journal") {
            Map<String, dynamic> map = settings.arguments as Map<String, dynamic>;
            final Journal journal = map["journal"] as Journal;
            final bool isEditing = map["isEditing"] as bool;
            
            return MaterialPageRoute(
                builder: (context) => AddJournalScreen(journal: journal, isEditing: isEditing,));
          }
        });
  }
}
