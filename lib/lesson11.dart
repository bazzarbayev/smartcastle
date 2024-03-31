import 'package:flutter/material.dart';

class Lesson11 extends StatefulWidget {
  const Lesson11({super.key});

  @override
  State<Lesson11> createState() => _Lesson11State();
}

class _Lesson11State extends State<Lesson11> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextFormField(
            controller: TextEditingController(),
            decoration: InputDecoration(labelText: 'sdf'),
          )
        ],
      ),
    );
  }
}
