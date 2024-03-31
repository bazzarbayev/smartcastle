
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lesson4/info.dart';
import 'package:http/http.dart' as http;

class ZzzList extends StatefulWidget {
  const ZzzList({super.key});

  @override
  State<ZzzList> createState() => _ZzzListState();
}

class _ZzzListState extends State<ZzzList> {
  List<Info> albums = [];

  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    getAlbums();
  }

  Future getAlbums() async {
    setState(() {
      isLoading = true;
    });
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));

    if (response.statusCode == 200) {
      List<Info> infos = List.from(jsonDecode(response.body))
          .map((map) => Map<String, dynamic>.from(map))
          .map((Map<String, dynamic> map) => Info.fromJson(map))
          .toList();

      setState(() {
        albums = infos;
      });

      albums.sort((a, b) => a.title!.compareTo(b.title!));

      setState(() {
        isLoading = false;
      });

      return infos;
    } else {
      throw 'Ошибка запроса';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading == true
          ? Center(child: CircularProgressIndicator())
          : SafeArea(
              child: ListView.builder(
                itemCount: albums.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                        tileColor: Colors.green,
                        title: Text(albums[index].title!)),
                  );
                },
              ),
            ),
    );
  }
}
