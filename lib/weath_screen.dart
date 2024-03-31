import 'package:flutter/material.dart';
import 'package:lesson4/weath_info.dart';

class WeathScreen extends StatefulWidget {
  const WeathScreen({super.key});

  @override
  State<WeathScreen> createState() => _WeathScreenState();
}

class _WeathScreenState extends State<WeathScreen> {
  TextEditingController cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Прогноз погоды'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextFormField(
              controller: cityController,
              decoration: InputDecoration(hintText: 'Введите название города'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WeathInfo(
                                cityName: cityController.text,
                              )));
                },
                child: Text('Получить погоду'))
          ],
        ),
      ),
    );
  }
}
