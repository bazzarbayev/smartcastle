import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'info.dart';

class Api5 extends StatefulWidget {
  const Api5({super.key});

  @override
  State<Api5> createState() => _Api5State();
}

class _Api5State extends State<Api5> {
  String titleFromServer = '';

  @override
  void initState() {
    super.initState();

    getInfoFromServer();
  }

  Future getInfoFromServer() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));

    print(response.statusCode);

    if (response.statusCode == 200) {
      Info info = Info.fromJson(jsonDecode(response.body));

      setState(() {
        titleFromServer = info.title!;
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
      body: Center(
        child: Text(
          titleFromServer,
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
