import 'package:flutter/material.dart';

class ReceptDetails extends StatefulWidget {
  String name;
  String image;
  String rating;
  List<String> ingredients;

  ReceptDetails(
      {super.key,
      required this.name,
      required this.image,
      required this.rating,
      required this.ingredients});

  @override
  State<ReceptDetails> createState() => _ReceptDetailsState();
}

class _ReceptDetailsState extends State<ReceptDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image.network(widget.image),
                  Positioned(
                    top: 20,
                    right: 20,
                    child: Text(
                      widget.rating,
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                widget.name,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text(
                'рейтинг: ${widget.rating}',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                'Ингредиенты',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              for (String ingredient in widget.ingredients)
                Text(
                  ingredient,
                  style: TextStyle(fontSize: 20),
                )
            ],
          ),
        ),
      ),
    );
  }
}
