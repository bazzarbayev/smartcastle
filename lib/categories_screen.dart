import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lesson4/gridview.dart';
import 'package:lesson4/products_screen.dart';

import 'catalog.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  List<String> categories = [];

  @override
  void initState() {
    super.initState();
    getCategories();
  }

  Future getCategories() async {
    final response =
        await http.get(Uri.parse('https://dummyjson.com/products/categories'));

    if (response.statusCode == 200) {
      setState(() {
        categories = List.from(jsonDecode(response.body));
      });
    }
  }

  String capitalizeOnlyFirstLetter(String word) {
    return word.substring(0, 1).toUpperCase() + word.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Категории'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: ListView.builder(
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    EdgeInsets.only(left: 10, right: 10, top: 6, bottom: 6),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Catalog(categoryName: categories[index])));
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Color.fromARGB(255, 250, 186, 89)),
                    child: Center(
                      child: Text(
                        capitalizeOnlyFirstLetter(
                          categories[index],
                        ),
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
