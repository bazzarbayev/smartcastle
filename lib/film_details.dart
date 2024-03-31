import 'package:flutter/material.dart';
import 'package:lesson4/lesson7.dart';

class FilmDetails extends StatefulWidget {
  String image;
  String name;
  String genre;
  double rating;
  String description;
  Movie movie;
  List<String> shoes;

  FilmDetails(
      {super.key,
      required this.image,
      required this.name,
      required this.genre,
      required this.rating,
      required this.description,
      required this.shoes,
      required this.movie});

  @override
  State<FilmDetails> createState() => _FilmDetailsState();
}

class _FilmDetailsState extends State<FilmDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Другой текст'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(height: 20),
            Center(
              child: Image.network(
                widget.image,
                width: 150,
                height: 150,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Название: ',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  widget.name,
                  style: TextStyle(fontSize: 24),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Жанр: ',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  widget.genre,
                  style: TextStyle(fontSize: 24),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Рейтинг: ',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  widget.rating.toString(),
                  style: TextStyle(fontSize: 24),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              widget.description,
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
