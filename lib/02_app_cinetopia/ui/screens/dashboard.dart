import 'package:flutter/material.dart';
import 'releases.dart';
import 'search_movies.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  int _currentIndex = 0;

  final List<Widget> _screens = <Widget>[
    SearchMovies(),
    Releases()
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: //Color(0xFF000000),
        Color(0xDB1D0E44),
      body: Padding(padding: EdgeInsets.fromLTRB(16, 54, 16, 0),
      child: _screens.elementAt(_currentIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        } ,
          currentIndex: _currentIndex,
          items: [
        BottomNavigationBarItem(icon: Icon(Icons.movie), label: "Filme"),
        BottomNavigationBarItem(icon: Icon(Icons.today), label: "Lançamentos"),
      ])  ,
    );
  }
}
