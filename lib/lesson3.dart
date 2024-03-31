import 'package:flutter/material.dart';

class Lesson3 extends StatefulWidget {
  const Lesson3({super.key});

  @override
  State<Lesson3> createState() => _Lesson3State();
}

class _Lesson3State extends State<Lesson3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Шапка',
            style: TextStyle(fontSize: 24, color: Colors.yellow),
          ),
          backgroundColor: Colors.green,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Text(
                  'Какой то текст',
                  style: TextStyle(color: Colors.green, fontSize: 20),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  Text(
                    'Еще один текст',
                    style: TextStyle(color: Colors.red, fontSize: 20),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'row1',
                    style: TextStyle(color: Colors.green, fontSize: 20),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'row2',
                    style: TextStyle(color: Colors.green, fontSize: 20),
                  ),
                ],
              ),
              Container(
                width: 200,
                height: 200,
                color: Colors.amber,
                child: Center(child: Text('Текст контейнера')),
              ),
              SizedBox(height: 20),
              Container(
                  color: Colors.green,
                  child: Image.asset(
                    'assets/mario.png',
                    height: 200,
                    width: 200,
                  )),
              Image.network(
                  'https://purepng.com/public/uploads/large/purepng.com-butterflybutterflyinsectsbloodwormwingspairs-1701528208264zeucc.png')
            ],
          ),
        ));
  }
}
