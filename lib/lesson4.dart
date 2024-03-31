import 'package:flutter/material.dart';

class Lesson4 extends StatefulWidget {
  const Lesson4({super.key});

  @override
  State<Lesson4> createState() => _Lesson4State();
}

class _Lesson4State extends State<Lesson4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(179, 26, 26, 26),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Сегодня в кино'),
      ),
      body: Column(
        children: [
          Divider(
            thickness: 0.5,
            height: 1,
            color: Color.fromARGB(112, 196, 196, 196),
          ),
          Container(
            color: Colors.black,
            padding: EdgeInsets.all(10.0),
            child: Row(
              children: [
                Text(
                  'Город',
                  style: TextStyle(color: Colors.white),
                ),
                Spacer(),
                Text(
                  'Шымкент',
                  style: TextStyle(color: Colors.grey[500]),
                )
              ],
            ),
          ),
          Divider(
            thickness: 0.5,
            height: 1,
            color: Color.fromARGB(112, 196, 196, 196),
          ),
          Container(
            color: Colors.black,
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Text(
                  'Дата',
                  style: TextStyle(color: Colors.white),
                ),
                Spacer(),
                Text(
                  '5 января, 2024',
                  style: TextStyle(color: Colors.grey[500]),
                )
              ],
            ),
          ),
          Divider(
            thickness: 0.5,
            height: 1,
            color: Color.fromARGB(112, 196, 196, 196),
          ),
          Container(
            color: Colors.black,
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Text(
                  'Жанры',
                  style: TextStyle(color: Colors.white),
                ),
                Spacer(),
                Text(
                  'Все жанры',
                  style: TextStyle(color: Colors.grey[500]),
                )
              ],
            ),
          ),
          Divider(
            thickness: 0.5,
            height: 1,
            color: Color.fromARGB(112, 196, 196, 196),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(10)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/mario.png',
                    width: 100,
                    height: 150,
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20),
                        Text(
                          'Мальчик и птица',
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Malchic i ptica',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'аниме, мультфильм',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        SizedBox(height: 4),
                        Row(
                          children: [
                            Text(
                              '7.8',
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(width: 4),
                            Text(
                              '13 053',
                              style: TextStyle(color: Colors.white),
                            ),
                            Spacer(),
                            Text(
                              'Япония',
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(width: 4),
                            Text(
                              '2:04',
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(width: 4)
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
