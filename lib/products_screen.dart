import 'package:flutter/material.dart';

class ProductsScreen extends StatefulWidget {
  String categoryName;
  ProductsScreen({super.key, required this.categoryName});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryName),
      ),
    );
  }
}
