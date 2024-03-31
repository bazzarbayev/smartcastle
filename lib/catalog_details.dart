import 'package:flutter/material.dart';

class CatalogDetails extends StatefulWidget {
  String image;
  String title;
  String description;
  String price;

  CatalogDetails(
      {super.key,
      required this.image,
      required this.title,
      required this.description,
      required this.price});

  @override
  State<CatalogDetails> createState() => _CatalogDetailsState();
}

class _CatalogDetailsState extends State<CatalogDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(widget.image),
            SizedBox(height: 20),
            Text(
              widget.title,
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              widget.description,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 16),
            Text(
              '${widget.price} ₸',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
