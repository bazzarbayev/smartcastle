import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:lesson4/nav_drawer_screen.dart';

void main() {
  runApp(const MainApp());

  initializeDateFormatting('ru', null).then((_) {});
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NavDrawerScreen(),
    );
  }
}
