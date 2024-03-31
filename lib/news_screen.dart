import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lesson4/news_model.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  List<Articles> newsFromServer = [];

  @override
  void initState() {
    super.initState();
    getNews();
  }

  Future getNews() async {
    final response = await http.get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?apiKey=d14db04d12c348a6bac286ea1cd84620&language=ru'));

    if (response.statusCode == 200) {
      NewsModel newsModel = NewsModel.fromJson(jsonDecode(response.body));

      setState(() {
        newsFromServer = newsModel.articles!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Новости'),
      ),
      body: ListView.separated(
        itemCount: newsFromServer.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  newsFromServer[index].title!,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(newsFromServer[index].author!),
                Text(newsFromServer[index].publishedAt!),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return Divider(
            height: 2,
            thickness: 1,
          );
        },
      ),
    );
  }
}
