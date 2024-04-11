import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:lesson4/login.dart';
import 'package:lesson4/people.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      // options: FirebaseOptions(
      //   apiKey: 'AIzaSyCy9LNeQ4wZxg8WxM7pNZ_gy2StEZxcCxs',
      //   appId: 'com.example.lesson4',
      //   messagingSenderId: 'sendid',
      //   projectId: 'smartcastle2-48832',
      //   storageBucket: 'smartcastle2-48832.appspot.com',
      // ),
      );

  runApp(const MainApp());

  initializeDateFormatting('ru', null).then((_) {});
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: People(),
    );
  }
}
