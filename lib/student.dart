import 'package:flutter/material.dart';

class Film_Details extends StatefulWidget {
  String
      image; //Пишем переменные тех данных которые хотим именно здесь показать с первой страницы Films
  String name;
  String genre;
  double rating;

  Film_Details(
      {super.key, //убрали просто const перед Film_Details
      required this.image,
      required this.name,
      required this.genre,
      required this.rating}); //таким образом мы создали конструктор

  @override
  State<Film_Details> createState() => _Film_DetailsState();
}

class _Film_DetailsState extends State<Film_Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('О фильме'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(children: [
          Center(
            child: Image.asset(
              'assets/Posters/CONAN.jpg',
              width: 200,
              height: 296,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment:
                MainAxisAlignment.center, //центролизвать содержимое в row
            children: [
              Text(
                'Название фильма: ',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                'CONAN',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment:
                MainAxisAlignment.center, //центролизвать содержимое в row
            children: [
              Text(
                'Жанр: ',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                'fantastic',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment:
                MainAxisAlignment.center, //центролизвать содержимое в row
            children: [
              Text(
                'Рейтинг: ',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '9.0',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}

class FilmsMode extends StatefulWidget {
  const FilmsMode({super.key});

  @override
  State<FilmsMode> createState() => _FilmsModeState();
}

class _FilmsModeState extends State<FilmsMode> {
  List<Film> films = [
    Film('CONAN', 'assets/Posters/CONAN_100x148.jpg', 'Фантастика, Драма', 9.0),
    Film('DEADPOOL', 'assets/Posters/DEADPOOL_100x148.jpg', 'Фантастика', 8.5),
    Film('BRING HIM HOME', 'assets/Posters/BRING_HIM_HOME_1_100x148.png',
        'Фантастика', 8.5),
    Film('GODZILLA', 'assets/Posters/GODZILLA_100x148.jpg', 'Фантастика', 8.5),
    Film(
        'HOW TO TRAIN YOUR DRAGON',
        'assets/Posters/HOW_TO_TRAIN_YOUR_DRAGON_100x148.jpg',
        'Фантастика',
        8.5),
    Film('IT FOLLOWS', 'assets/Posters/IT_FOLLOWS_1_100x148.jpg', 'Фантастика',
        8.5),
    Film('KINGSMAN', 'assets/Posters/KINGSMAN_100x148.jpg', 'Фантастика', 8.5),
    Film(
        'LET ME IN', 'assets/Posters/LET_ME_IN_100x148.jpg', 'Фантастика', 8.5),
    Film('MAIL ORDER BRIDE', 'assets/Posters/MAIL_ORDER_BRIDE_100x148.jpg',
        'Фантастика', 6),
    Film('THE CABIN IN THE WOODS',
        'assets/Posters/THE_CABIN_IN_THE_WOODS_100x148.jpg', 'Фантастика', 5),
    Film('THE COUNJURING', 'assets/Posters/THE_CONJURING_1_100x148.jpg',
        'Фантастика', 8.5),
    Film('THE DEVILS DOUBLE', 'assets/Posters/THE_DEVILS_DOUBLE_100x148.jpg',
        'Фантастика', 8.5),
    Film('THE MASTER', 'assets/Posters/THE_MASTER_100x148.jpg', 'Фантастика',
        8.5),
    Film(
        'WOLVERINE', 'assets/Posters/WOLVERINE_100x148.jpg', 'Фантастика', 8.5),
  ];

  var ratingColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Center(
            child: Text('Фильмы', style: TextStyle(color: Colors.black))),
      ),
      backgroundColor: Colors.grey,
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
              padding: EdgeInsets.all(1.5),
              child: Container(
                padding: EdgeInsets.all(7),
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 150, 122, 15),
                    borderRadius:
                        BorderRadius.circular(16)), //делаем авайльный контейнер
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: ClipRRect(
                        // чтобы обрезать углы изображения внутри контейнера изоброжения
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          films[index].image,
                          width: 100,
                          height: 148,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    //Image.asset(name),
                    Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start, //Показывает слева
                      children: [
                        Text(
                          films[index].name,
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          films[index].genre,
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          films[index].rating.toString(),
                          style: TextStyle(
                              fontSize: 18,
                              color: ratingColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
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

  Film(this.name, this.image, this.genre, this.rating);
}
