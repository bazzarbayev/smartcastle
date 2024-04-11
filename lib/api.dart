import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lesson4/api/api_model.dart';

class Api extends StatefulWidget {
  const Api({super.key});

  @override
  State<Api> createState() => _ApiState();
}

class _ApiState extends State<Api> {
  String title = '';
  String desc = '';
  int price = 0;
  String image = '';

  bool loading = false;

  @override
  void initState() {
    super.initState();

    getInfo();
  }

  Future getInfo() async {
    setState(() {
      loading = true;
    });

    final response =
        await http.get(Uri.parse('https://dummyjson.com/products/1'));

    if (response.statusCode == 200) {
      ApiModel apiModel = ApiModel.fromJson(jsonDecode(response.body));

      setState(() {
        title = apiModel.title!;
        desc = apiModel.description!;
        price = apiModel.price!;
        image = apiModel.images!.first;

        loading = false;
      });
    } else {
      throw 'ошибка запроса';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API'),
      ),
      body: loading == true
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    desc,
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    price.toString(),
                    style: TextStyle(fontSize: 20),
                  ),
                  Image.network(image)
                ],
              ),
            ),
    );
  }
}
