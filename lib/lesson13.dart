// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:lesson4/film_details.dart';
import 'package:lesson4/lesson7.dart';

class Lesson13 extends StatefulWidget {
  const Lesson13({super.key});

  @override
  State<Lesson13> createState() => _Lesson13State();
}

class _Lesson13State extends State<Lesson13> {
  List<Film> films = [
    Film(
        'Аватар',
        'https://sputnik.kg/img/101808/12/1018081237_1488:0:4629:3455_1920x0_80_0_0_36b9c41458690f8543f8ce86421ba380.jpg',
        'Фантастика',
        9.0,
        'Полное описание фильма какой то длиннныыыыыыыыыыыыыыыыыыыыыыыый текст'),
    Film(
        'Гарри Поттер',
        'https://avatars.mds.yandex.net/get-kinopoisk-image/4774061/33c409d8-6c98-4019-94f8-a162d5ce8e26/600x900',
        'Фантастика',
        5.0,
        'Полное описание фильма'),
    Film(
        'Троя',
        'https://img4.labirint.ru/rc/21c7efb30749000b1c0589ab823e6991/363x561q80/books7/60034/cover.jpg?1280394613',
        'Боевик',
        8.3,
        'Полное описание фильма'),
    Film(
        'Мадагаскар',
        'https://sun9-72.userapi.com/impg/iKMhsVHE-7j0WQOdYNCIi8cKL5RVLk-5NcDGKQ/dmEwQ2eG_7U.jpg?size=403x604&quality=96&sign=baf49af2e6d51925e485b08b0a6d2a05&type=album',
        'Мультфильм',
        6.0,
        'Полное описание фильма'),
    Film(
        'Человек паук',
        'https://avatars.mds.yandex.net/get-kinopoisk-image/6201401/731c4031-7389-44f4-8c15-f9f4e3b0ed90/600x900',
        'Фантастика',
        9.0,
        'Полное описание фильма'),
  ];

  var ratingColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        title: Text('Фильмы'),
      ),
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: films.length,
          itemBuilder: (context, index) {
            if (films[index].rating > 7) {
              ratingColor = Colors.green;
            } else {
              ratingColor = Colors.grey;
            }

            return Padding(
              padding: EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FilmDetails(
                        image: films[index].image,
                        name: films[index].name,
                        genre: films[index].genre,
                        rating: films[index].rating,
                        description: films[index].description,
                        movie: Movie(
                            title: 'fdd',
                            description: 'dfgfdg',
                            imageUrl: 'dfgdf'),
                        shoes: ['sdfsdf', 'sdfdsf', 'sdfsfs'],
                      ),
                    ),
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(16)),
                  child: Row(
                    children: [
                      Image.network(
                        films[index].image,
                        width: 100,
                        height: 100,
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Какой то длинннныыыыыыыыыыыйййййййй тексттт фильм описание',
                              maxLines: 1,
                              style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              films[index].genre,
                              style: TextStyle(fontSize: 18),
                            ),
                            Row(
                              children: [
                                Text(
                                  films[index].rating.toString(),
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: ratingColor,
                                      fontWeight: FontWeight.bold),
                                ),
                                Spacer(),
                                Text(
                                  'Казахстан',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}

class Film {
  String name;
  String image;
  String genre;
  double rating;
  String description;

  Film(this.name, this.image, this.genre, this.rating, this.description);
}
