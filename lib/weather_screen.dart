import 'package:flutter/material.dart';
import 'package:lesson4/weather_info.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  TextEditingController cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blue, Colors.white],
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 70),
            Text(
              'Прогноз погоды',
              style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 60),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: TextFormField(
                controller: cityController,
                decoration: InputDecoration(
                    hintText: 'Введите город',
                    hintStyle: TextStyle(fontSize: 20, color: Colors.white)),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              WeatherInfo(city: cityController.text)));
                },
                child: Text('Получить погоду'))
          ],
        ),
      ),
    );
  }
}
