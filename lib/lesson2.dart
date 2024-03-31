import 'package:flutter/material.dart';

class Lesson2 extends StatefulWidget {
  const Lesson2({super.key});

  @override
  State<Lesson2> createState() => _Lesson2State();
}

class _Lesson2State extends State<Lesson2> {
  String a = 'hi';
  List<String> products = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text(
          'Шапка',
          style: TextStyle(color: Colors.green),
        ),
      ),
      body: Center(
        child: Text(
          a,
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
