import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lesson4/recept_details.dart';
import 'package:lesson4/recept_model.dart';

class ReceptScreen extends StatefulWidget {
  const ReceptScreen({super.key});

  @override
  State<ReceptScreen> createState() => _ReceptScreenState();
}

class _ReceptScreenState extends State<ReceptScreen> {
  List<Recipes> recipes = [];

  @override
  void initState() {
    super.initState();

    getRecepts();
  }

  Future getRecepts() async {
    final response = await http.get(Uri.parse('https://dummyjson.com/recipes'));

    if (response.statusCode == 200) {
      ReceptModel receptModel = ReceptModel.fromJson(jsonDecode(response.body));

      setState(() {
        recipes = receptModel.recipes!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Рецепты'),
        backgroundColor: Colors.orange,
      ),
      body: RefreshIndicator(
        onRefresh: getRecepts,
        child: ListView.builder(
            itemCount: recipes.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ReceptDetails(
                                  name: recipes[index].name!,
                                  image: recipes[index].image!,
                                  rating: recipes[index].rating.toString(),
                                  ingredients: recipes[index].ingredients!,
                                )));
                  },
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Image.network(recipes[index].image!),
                          Positioned(
                            top: 20,
                            right: 20,
                            child: Text(
                              recipes[index].rating.toString(),
                              style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          recipes[index].name!,
                          style: TextStyle(
                              fontSize: 26, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
