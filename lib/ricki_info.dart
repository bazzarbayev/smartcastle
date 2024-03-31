import 'package:flutter/material.dart';

class RickiInfo extends StatefulWidget {
  String name;
  String image;
  String status;
  RickiInfo(
      {super.key,
      required this.name,
      required this.image,
      required this.status});

  @override
  State<RickiInfo> createState() => _RickiInfoState();
}

class _RickiInfoState extends State<RickiInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.name)),
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(left: 40, right: 40),
          child: Column(
            children: [
              SizedBox(height: 20),
              Image.network(widget.image),
              SizedBox(height: 20),
              Text(
                widget.name,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'status: ',
                    style: TextStyle(fontSize: 24),
                  ),
                  Text(
                    widget.status,
                    style: TextStyle(fontSize: 24),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
