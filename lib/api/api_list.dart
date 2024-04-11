import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:lesson4/news.dart';
import 'package:lesson4/profile.dart';

class ApiList extends StatefulWidget {
  const ApiList({super.key});

  @override
  State<ApiList> createState() => _ApiListState();
}

class _ApiListState extends State<ApiList> {
  List<Profile> users = [];
  List<Articles> newsFromServer = [];

  bool usersLoading = false;
  bool newsLoading = false;

  DateTime currentTime = DateTime.now();

  @override
  void initState() {
    super.initState();

    getNews();
  }

  Future getNews() async {
    setState(() {
      newsLoading = true;
    });
    final response = await http.get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?apiKey=d14db04d12c348a6bac286ea1cd84620&language=ru'));

    if (response.statusCode == 200) {
      News news = News.fromJson(jsonDecode(response.body));
      setState(() {
        newsFromServer = news.articles!;
        newsLoading = false;
      });
    }
  }

  Future getUsers() async {
    setState(() {
      usersLoading = true;
    });

    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    if (response.statusCode == 200) {
      List<Profile> usersFromApi = List.from(jsonDecode(response.body))
          .map((map) => Map<String, dynamic>.from(map))
          .map((Map<String, dynamic> map) => Profile.fromJson(map))
          .toList();

      setState(() {
        users = usersFromApi;
        usersLoading = false;
      });
    } else {
      throw 'Ошибка запроса';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NEWS LIST'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          setState(() {
            currentTime = DateTime.now();
          });

          getNews();
        },
        child: newsLoading == true
            ? Center(
                child: Platform.isIOS
                    ? CupertinoActivityIndicator()
                    : CircularProgressIndicator(),
              )
            : Column(
                children: [
                  Text(
                    'Дата обновления: ${DateFormat('HH:mm:ss').format(currentTime)}',
                    style: TextStyle(fontSize: 24),
                  ),
                  Expanded(
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemCount: newsFromServer.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                newsFromServer[index].title!,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 4.0),
                              Row(
                                children: [
                                  Text(
                                    'автор: ',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Expanded(
                                    child: Text(
                                      newsFromServer[index].author!,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 4.0),
                              Text(
                                DateFormat('dd MMMM yyyy', 'ru').format(
                                  DateTime.parse(
                                      newsFromServer[index].publishedAt!),
                                ),
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return Divider(
                          thickness: 2,
                          height: 0,
                        );
                      },
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
