import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lesson4/weather_model.dart';

class WeathInfo extends StatefulWidget {
  String cityName;
  WeathInfo({super.key, required this.cityName});

  @override
  State<WeathInfo> createState() => _WeathInfoState();
}

class _WeathInfoState extends State<WeathInfo> {
  double temp = 0.0;
  String status = '';

  @override
  void initState() {
    super.initState();
    getWeather();
  }

  Future getWeather() async {
    final response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=${widget.cityName}&appid=1369dd6b5ae78fc9952261ab9aa236b4&units=metric'));

    if (response.statusCode == 200) {
      WeatherModel weatherModel =
          WeatherModel.fromJson(jsonDecode(response.body));

      setState(() {
        temp = weatherModel.main!.temp!;
        status = weatherModel.weather!.first.main!;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.orange,
          behavior: SnackBarBehavior.floating,
          duration: Duration(seconds: 2),
          content: Center(
            child: Text(
              jsonDecode(response.body)['message'],
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Информация о погоде')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.cityName,
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
            Text(
              '$temp°C',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              status,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
