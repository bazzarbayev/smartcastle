import 'package:flutter/material.dart';

class lesson5 extends StatefulWidget {
  const lesson5({super.key});

  @override
  State<lesson5> createState() => _lesson5State();
}

class _lesson5State extends State<lesson5> {
  List<Film> films = [
    Film('МАРСИАНИН', 'THE MARTIAN', 'assets/mario.png',
        'фантастика, приключения', 7.8, 'США'),
    Film('КОНАН', 'CONAN', 'assets/mario.png', 'Страшилка', 6, 'США'),
    Film('ДЕДПУЛ', 'DEADPOOL', 'assets/mario.png', 'Комедия', 8, 'США'),
    Film('ГОДЗИЛЛА', 'GODZILLA', 'assets/mario.png', 'Страшилка', 6, 'США'),
    Film('Длинныйййййййй текстттттттттттттттт', 'IT FOLLOWS',
        'assets/mario.png', 'Комедия', 8, 'США'),
    Film('1', 'HOW TO TRAIN YOUR DRAGON', 'assets/mario.png', 'Комедия', 8,
        'США'),
    Film('1', 'KINGSMAN', 'assets/mario.png', 'Комедия', 8, 'США'),
    Film('1', 'LET ME IN', 'assets/mario.png', 'Комедия', 8, 'США'),
    Film('1', 'MAIL ORDER BRIDE', 'assets/mario.png', 'Комедия', 8, 'США'),
    Film(
        '1', 'THE CABIN IN THE WOODS', 'assets/mario.png', 'Комедия', 8, 'США'),
    Film('1', 'THE CONJURING', 'assets/mario.png', 'Комедия', 8, 'США'),
    Film('1', 'THE DEVILS DOUBLE', 'assets/mario.png', 'Комедия', 8, 'США'),
    Film('1', 'THE MASTER', 'assets/mario.png', 'Комедия', 8, 'США'),
    Film('1', 'WOLVERINE', 'assets/mario.png', 'Комедия', 8, 'США'),
  ];

  var ratingColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text(
          'Фильмы',
          style: TextStyle(
              fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: films.length,
          itemBuilder: (context, index) {
            if (films[index].rating > 7) {
              ratingColor = Colors.green;
            } else {
              ratingColor = Colors.red;
            }
            return Container(
              color: Color.fromARGB(255, 42, 41, 41),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5.0),
                      child: Container(
                        color: Colors.black,
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5.0),
                                child: Image.asset(films[index].image,
                                    width: 100, height: 148),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      films[index].rusName,
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      films[index].name,
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.white),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(height: 10),
                                    Text(films[index].genre,
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Color.fromARGB(
                                                221, 150, 150, 150))),
                                    SizedBox(height: 10),
                                    Row(
                                      children: [
                                        Text(films[index].rating.toString(),
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: ratingColor)),
                                        Spacer(),
                                        Padding(
                                          padding: EdgeInsets.only(right: 10),
                                          child: Text(films[index].country,
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Color.fromARGB(
                                                      221, 150, 150, 150))),
                                        ),
                                      ],
                                    ),
                                  ]),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}

class Film {
  String rusName;
  String name;
  String image;
  String genre;
  double rating;
  String country;

  Film(this.rusName, this.name, this.image, this.genre, this.rating,
      this.country);
}

void main() {
  runApp(const MaterialApp(
    home: lesson5(),
  ));
}
