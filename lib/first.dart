// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class First extends StatefulWidget {
  const First({super.key});

  @override
  State<First> createState() => _FirstState();
}

class _FirstState extends State<First> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Информация о фильме",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        // backgroundColor: Colors.yellow,
        // centerTitle: true,
      ),
      body: Column(
        children: [
          // Заголовок фильма
          Image.network(
            'https://via.placeholder.com/200',
            width: 200,
            height: 300,
          ),

          Image.asset('assets/2.png', height: 100, width: 100),

          Text(
            'Название фильма: Загадочное приключение',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.blue, // Изменим цвет текста
            ),
          ),
          // Информация о режиссере и год выпуска
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Режиссер:',
                style: TextStyle(
                  color: Colors.grey, // Изменим цвет текста
                  fontSize: 16,
                ),
              ),
              Text(
                'Квентин Тарантино',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Изменим цвет текста
                  fontSize: 16,
                ),
              ),
              Text(
                '   Год выпуска:',
                style: TextStyle(
                  color: Colors.grey, // Изменим цвет текста
                  fontSize: 16,
                ),
              ),
              Text(
                '2023',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Изменим цвет текста
                  fontSize: 16,
                ),
              ),
            ],
          ),
          // Описание фильма
          Text(
            'Описание: Длинное и увлекательное описание фильма, рассказывающее о его сюжете и интересных персонажах.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.green, // Изменим цвет текста
            ),
          ),
          // Рейтинг фильма
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Рейтинг:',
                style: TextStyle(
                  color: Colors.grey, // Изменим цвет текста
                  fontSize: 16,
                ),
              ),
              Text(
                '4.5/5',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.orange, // Изменим цвет текста
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
