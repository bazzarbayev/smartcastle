import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:lesson4/ricki_model.dart';

class RickiScreen extends StatefulWidget {
  const RickiScreen({super.key});

  @override
  State<RickiScreen> createState() => _RickiScreenState();
}

class _RickiScreenState extends State<RickiScreen> {
  List<Results> rickis = [];
  int? page;
  String name = '';

  bool loading = false;

  @override
  void initState() {
    super.initState();
    getRickis();
  }

  Future getRickis() async {
    page = 1;
    final response = await http
        .get(Uri.parse('https://rickandmortyapi.com/api/character?page=$page'));

    if (response.statusCode == 200) {
      RickiModel rickiModel = RickiModel.fromJson(jsonDecode(response.body));

      setState(() {
        rickis = rickiModel.results!;
      });
    }
  }

  Future getMoreRickis() async {
    setState(() {
      loading = true;
    });
    page = page! + 1;
    final response = await http
        .get(Uri.parse('https://rickandmortyapi.com/api/character?page=$page'));

    if (response.statusCode == 200) {
      RickiModel rickiModel = RickiModel.fromJson(jsonDecode(response.body));

      setState(() {
        rickis += rickiModel.results!;
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rick and Morty'),
      ),
      body: LazyLoadScrollView(
        onEndOfPage: () {
          getMoreRickis();
        },
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: TextField(
                decoration: InputDecoration(hintText: 'Поиск'),
                onChanged: (value) async {
                  print(value);
                  setState(() {
                    name = value;
                  });

                  final response = await http.get(Uri.parse(
                      'https://rickandmortyapi.com/api/character?page=1&name=$value'));

                  if (response.statusCode == 200) {
                    RickiModel rickiModel =
                        RickiModel.fromJson(jsonDecode(response.body));

                    setState(() {
                      rickis = rickiModel.results!;
                    });
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: rickis.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.all(10),
                      decoration:
                          BoxDecoration(border: Border.all(color: Colors.red)),
                      child: Row(
                        children: [
                          Image.network(
                            rickis[index].image!,
                            width: 150,
                            height: 150,
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  rickis[index].name!,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: rickis[index].status == 'Alive'
                                              ? Colors.green
                                              : rickis[index].status == 'Dead'
                                                  ? Colors.red
                                                  : Colors.grey),
                                      height: 20,
                                      width: 20,
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      rickis[index].status!,
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ],
                                ),
                                Text(
                                  rickis[index].location!.name!,
                                  style: TextStyle(fontSize: 20),
                                ),
                                Text(
                                  rickis[index].gender!,
                                  style: TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: loading == true
                    ? Center(child: CircularProgressIndicator())
                    : Container())
          ],
        ),
      ),
    );
  }
}
