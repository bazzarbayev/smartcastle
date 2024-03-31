import 'package:flutter/material.dart';

class Prof extends StatefulWidget {
  String login;

  Prof({super.key, required this.login});

  @override
  State<Prof> createState() => _ProfState();
}

class _ProfState extends State<Prof> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Профиль'),
      ),
      body: Center(
        child: Text(
          widget.login,
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
