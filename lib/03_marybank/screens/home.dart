import 'package:flutter/material.dart';
import '../components/section/header.dart';
import '../components/section/accounts_dots.dart';
import '/03_marybank/components/section/count_actions.dart';
import '/03_marybank/components/section/recent_activities.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Header(),
          RecentActivities(),
          AccountActions(),
          AccountsDots(),
        ],
      ),
    );
  }
}
