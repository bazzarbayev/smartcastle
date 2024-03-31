import 'package:flutter/material.dart';

class Glavni extends StatefulWidget {
  const Glavni({super.key});

  @override
  State<Glavni> createState() => _GlavniState();
}

class _GlavniState extends State<Glavni> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Сегодня в кино",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(children: [
              Text("Город",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              Spacer(),
              Text("Шымкент",
                  style:
                      TextStyle(fontWeight: FontWeight.normal, fontSize: 18)),
            ]),
            Row(
              children: [
                Text("Дата",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                Spacer(),
                Text("12 декабря, 2023",
                    style:
                        TextStyle(fontWeight: FontWeight.normal, fontSize: 18)),
              ],
            ),
            Row(
              children: [
                Text("Жанры",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                Spacer(),
                Text("Все жанры",
                    style:
                        TextStyle(fontWeight: FontWeight.normal, fontSize: 18)),
              ],
            ),
            SizedBox(height: 15),
            Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 0),
                      child: Image.network(
                        "https://upload.wikimedia.org/wikipedia/ru/9/93/%D0%9C%D0%B0%D0%BB%D1%8C%D1%87%D0%B8%D0%BA_%D0%B8_%D0%BF%D1%82%D0%B8%D1%86%D0%B0_%D0%BF%D0%BE%D1%81%D1%82%D0%B5%D1%80.jpeg",
                        width: 80,
                        height: 120,
                      ),
                    ),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Мальчик и птица",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17)),
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text("Kimtachi wa Dou Ikuru ka (2023)",
                              style: TextStyle(
                                  fontWeight: FontWeight.normal, fontSize: 16)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: Text("аниме, мультфильм, драма",
                              style: TextStyle(
                                  fontWeight: FontWeight.normal, fontSize: 14)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Text("7.8",
                              style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16)),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
