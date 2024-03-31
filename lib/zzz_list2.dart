import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lesson4/info.dart';

class ZzzList2 extends StatefulWidget {
  const ZzzList2({super.key});

  @override
  State<ZzzList2> createState() => _ZzzList2State();
}

class _ZzzList2State extends State<ZzzList2> {
  List<String> products = ['apple', 'banana', 'cola'];
  List<Info> infoList = [];

  bool listLoading = false;

  @override
  void initState() {
    super.initState();

    getInfoList();
  }

  Future getInfoList() async {
    setState(() {
      listLoading = true;
    });

    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));

    if (response.statusCode == 200) {
      List<Info> apiList = List.from(jsonDecode(response.body))
          .map((map) => Map<String, dynamic>.from(map))
          .map((Map<String, dynamic> map) => Info.fromJson(map))
          .toList();

      setState(() {
        infoList = apiList;
      });

      infoList.sort(((a, b) => a.title!.compareTo(b.title!)));

      setState(() {
        listLoading = false;
      });

      print('vse ok!!!');
    } else {
      throw '4to to ne tak!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API List'),
      ),
      body: listLoading == true
          ? Center(child: CircularProgressIndicator())
          : ListView.separated(
              itemCount: infoList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(
                      left: 10, top: 4, bottom: 4, right: 10),
                  child: Text(
                    infoList[index].title!,
                    style: TextStyle(fontSize: 26),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider(
                  thickness: 2,
                  height: 0,
                );
              },
            ),
    );
  }
}
