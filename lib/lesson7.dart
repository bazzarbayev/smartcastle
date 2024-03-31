import 'package:flutter/material.dart';

class Lesson7 extends StatefulWidget {
  const Lesson7({super.key});

  @override
  State<Lesson7> createState() => _Lesson7State();
}

class _Lesson7State extends State<Lesson7> {
  List<Movie> movies = [
    Movie(
      title: 'Название фильма 1',
      description: 'Описание фильма 1',
      imageUrl: 'assets/images/movie1.jpg',
    ),
    Movie(
      title: 'Название фильма 2',
      description: 'Описание фильма 2',
      imageUrl: 'assets/images/movie2.jpg',
    ),
    Movie(
      title: 'Название фильма 3',
      description: 'Описание фильма 3',
      imageUrl: 'assets/images/movie2.jpg',
    ),
    Movie(
      title: 'Название фильма 4',
      description: 'Описание фильма 4',
      imageUrl: 'assets/images/movie2.jpg',
    ),
    Movie(
      title: 'Название фильма 4',
      description: 'Описание фильма 4',
      imageUrl: 'assets/images/movie2.jpg',
    ),
    // Добавьте другие фильмы по аналогии
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: movies.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(movies[index].title),
            subtitle: Text(movies[index].description),
            leading: CircleAvatar(
              backgroundImage: AssetImage(movies[index].imageUrl),
            ),
          );
        },
      ),
    );
  }
}

class Movie {
  final String title;
  final String description;
  final String imageUrl;

  Movie(
      {required this.title, required this.description, required this.imageUrl});
}
