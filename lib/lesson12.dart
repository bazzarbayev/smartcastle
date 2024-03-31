import 'package:flutter/material.dart';
import 'package:lesson4/oplata.dart';

class Lesson12 extends StatefulWidget {
  const Lesson12({super.key});

  @override
  State<Lesson12> createState() => _Lesson12State();
}

class _Lesson12State extends State<Lesson12> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Продукты'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/maslo.png',
                  width: 100,
                  height: 100,
                ),
                SizedBox(width: 20),
                Column(
                  children: [
                    Text(
                      'Масло',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text('500тг')
                  ],
                ),
              ],
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Oplata()));
              },
              child: Row(
                children: [
                  Image.asset(
                    'assets/xleb.png',
                    width: 100,
                    height: 100,
                  ),
                  SizedBox(width: 20),
                  Column(
                    children: [
                      Text(
                        'Хлеб',
                        style: TextStyle(fontSize: 20),
                      ),
                      Text('200тг')
                    ],
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Image.asset(
                  'assets/sok.png',
                  width: 100,
                  height: 100,
                ),
                SizedBox(width: 20),
                Column(
                  children: [
                    Text(
                      'Сок',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text('600тг')
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            SizedBox(
              width: 200,
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Oplata()));
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16))),
                child: Text(
                  'Оплатить',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
