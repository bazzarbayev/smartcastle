import 'package:flutter/material.dart';

class Oplata extends StatefulWidget {
  const Oplata({super.key});

  @override
  State<Oplata> createState() => _OplataState();
}

class _OplataState extends State<Oplata> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 200),
            Text(
              'Поздравляю!',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              'Оплата успешно прошла!',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            SizedBox(
                width: 200,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Назад')))
          ],
        ),
      ),
    );
  }
}
