import 'package:flutter/material.dart';

class Lesson20 extends StatefulWidget {
  const Lesson20({super.key});

  @override
  State<Lesson20> createState() => _Lesson20State();
}

class _Lesson20State extends State<Lesson20> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, '/lesson21');
        },
        child: Text('Далее'),
      ),
    );
  }
}
