import 'package:flutter/material.dart';

class Domawka extends StatefulWidget {
  const Domawka({super.key});

  @override
  State<Domawka> createState() => _DomawkaState();
}

class _DomawkaState extends State<Domawka> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Информация о фильме'),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/pin.png',
                  height: 200,
                  width: 200,
                ),
              ],
            ),
          ),
        ));
  }
}
