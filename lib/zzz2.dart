import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lesson4/info.dart';
import 'package:http/http.dart' as http;

class zzz2 extends StatefulWidget {
  const zzz2({super.key});

  @override
  State<zzz2> createState() => _zzz2State();
}

class _zzz2State extends State<zzz2> {
  String textFromServer = '';

  @override
  void initState() {
    super.initState();

    getInfo();
  }

  Future<Info> getInfo() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

    print(response.statusCode);

    if (response.statusCode == 200) {
      Info infoModel = Info.fromJson(jsonDecode(response.body));

      setState(() {
        textFromServer = infoModel.title!;
      });

      return infoModel;
    } else {
      throw 'Ошибка запроса';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'Текст из сервера: ',
                  style: TextStyle(fontSize: 26),
                ),
                Flexible(
                  child: Text(
                    textFromServer,
                    style: TextStyle(fontSize: 26),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
