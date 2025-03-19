import 'package:flutter/material.dart';
import 'models/journal.dart';
import 'screens/home_screen/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/add_journal_screen/add_journal_screen.dart';

class NoteDiaryApp extends StatelessWidget {
  const NoteDiaryApp({Key? key}) : super(key: key);
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
        initialRoute: "home",
        routes: {
          "home": (context) => const HomeScreen(),
        },
        onGenerateRoute: (settings){
          if (settings.name == "add-journal") {
            final Journal journal = settings.arguments as Journal;
            return MaterialPageRoute(
                builder: (context) => AddJournalScreen(journal: journal));
          }
        });
  }
}
