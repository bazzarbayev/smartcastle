import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lesson4/weather_model.dart';

class WeatherInfo extends StatefulWidget {
  String city;
  WeatherInfo({super.key, required this.city});

  @override
  State<WeatherInfo> createState() => _WeatherInfoState();
}

class _WeatherInfoState extends State<WeatherInfo> {
  double temp = 0.0;
  String state = '';
  String image = '';

  @override
  void initState() {
    super.initState();
    getWeather();
  }

  Future getWeather() async {
    final response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=${widget.city}&appid=1369dd6b5ae78fc9952261ab9aa236b4&units=metric'));

    if (response.statusCode == 200) {
      WeatherModel weatherModel =
          WeatherModel.fromJson(jsonDecode(response.body));

      setState(() {
        temp = weatherModel.main!.temp!;
        state = weatherModel.weather![0].main!;

        if (state == 'Snow') {
          image = 'assets/snow.jpg';
        } else if (state == 'Clouds') {
          image = 'assets/clear.jpg';
        } else if (state == 'Rainy') {
          image = 'assets/rain.jpg';
        } else {
          image = 'assets/clear.jpg';
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            image,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 80),
              Text(
                widget.city,
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 10),
              Text(
                '$temp°C',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                state,
                style: TextStyle(fontSize: 24),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
