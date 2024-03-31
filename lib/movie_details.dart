// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class MovieDetails extends StatefulWidget {
  String name;
  String image;
  String genre;
  int year;

  MovieDetails(
      {super.key,
      required this.name,
      required this.genre,
      required this.image,
      required this.year});

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_circle_left_outlined,
              color: Colors.amber,
            )),
        title: Text('О фильме'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Center(
              child: Image.network(
                widget.image,
                height: 400,
              ),
            ),
            SizedBox(height: 20),
            Text(
              widget.name,
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              widget.genre,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              widget.year.toString(),
              style: TextStyle(fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
