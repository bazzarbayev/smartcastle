import 'package:flutter/material.dart';

class Second extends StatefulWidget {
  const Second({super.key});

  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> {
  List<String> products = ['apple', 'banana', 'tomato', 'orange'];
  List<int> numbers = [25, 2, 100, 50, 35];

  @override
  Widget build(BuildContext context) {
    products.add('strawberry');

    int a = 10;
    int b = 20;
    int c = a + b;

    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text(
          'Шапка',
          style: TextStyle(color: Colors.green),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Text(
              numbers[0].toString(),
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            c.toString(),
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
          Row(
            children: [Text('data'), SizedBox(width: 20), Text('sdfsdf')],
          ),
          Container(
            height: 100,
            width: 100,
            color: Colors.red,
          ),
        ],
      ),
    );
  }
}
