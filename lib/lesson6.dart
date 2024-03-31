import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Lesson6 extends StatefulWidget {
  const Lesson6({super.key});

  @override
  State<Lesson6> createState() => _Lesson6State();
}

class _Lesson6State extends State<Lesson6> {
  String a = 'Smart';
  String b = 'Castle';
  int c = 25;
  double d = 32.5;
  bool f = true;

  @override
  Widget build(BuildContext context) {
    List<bool> fruits = [true, false, false, true];
    fruits.add(false);
    // fruits.add('banana');
    // fruits.add('orange');

    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Lesson6',
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
          backgroundColor: Colors.orange,
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 20),
              Text(
                fruits.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: d),
              )
            ],
          ),
        ));
  }
}
