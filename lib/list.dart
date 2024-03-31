import 'package:flutter/material.dart';
import 'package:lesson4/movie_details.dart';

import 'movie.dart';

class ListClass extends StatefulWidget {
  const ListClass({super.key});

  @override
  State<ListClass> createState() => _ListClassState();
}

class _ListClassState extends State<ListClass> {
  List<Movie> films = [
    Movie(
        'Шрек',
        'https://musicart.xboxlive.com/7/3b8e1600-0000-0000-0000-000000000002/504/image.jpg?w=1920&h=1080',
        'фантастика',
        1997),
    Movie(
        'Мадагаскар',
        'https://image.pmgstatic.com/cache/resized/w420/files/images/film/posters/159/513/159513716_33238b.jpg',
        'комедия',
        2010),
    Movie(
        'Гарри Поттер',
        'https://static.independent.co.uk/s3fs-public/thumbnails/image/2013/09/12/17/potter.jpg',
        'фантастика',
        2001),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Список фильмов'),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: films.length,
        itemBuilder: (BuildContext context, int index) {
          return Center(
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MovieDetails(
                              name: films[index].name,
                              image: films[index].image,
                              genre: films[index].genre,
                              year: films[index].year,
                            )));
              },
              child: Padding(
                padding: EdgeInsets.only(top: 8, bottom: 8),
                child: Container(
                  color: Colors.amber,
                  child: Row(
                    children: [
                      Image.network(
                        films[index].image,
                        width: 100,
                        height: 100,
                      ),
                      SizedBox(width: 10),
                      Column(
                        children: [
                          Text(
                            films[index].name,
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(films[index].genre)
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
