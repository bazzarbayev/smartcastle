import 'package:flutter/material.dart';

class Lesson10 extends StatefulWidget {
  const Lesson10({super.key});

  @override
  State<Lesson10> createState() => _Lesson10State();
}

class _Lesson10State extends State<Lesson10> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Вторая страница'),
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Text(
            'Какой то текст',
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Вернуться назад'),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                )),
          )
        ],
      ),
    );
  }
}
