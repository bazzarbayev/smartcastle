import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Grid extends StatefulWidget {
  String categoryName;
  Grid({super.key, required this.categoryName});

  @override
  State<Grid> createState() => _GridState();
}

class Item {
  late String image;
  late String name;

  Item(this.image, this.name);
}

class _GridState extends State<Grid> {
  List<Item> items = [Item('sfsdfsdf', 'sfssdf')];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //Row category,

          GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, // number of items in each row
              mainAxisSpacing: 8.0, // spacing between rows
              crossAxisSpacing: 8.0, // spacing between columns
            ),
            padding: EdgeInsets.all(8.0), // padding around the grid
            itemCount: items.length, // total number of items
            itemBuilder: (context, index) {
              return Container(
                color: Colors.blue,
                child: Center(
                  child: Text(
                    items[index].name,
                    style: TextStyle(fontSize: 18.0, color: Colors.white),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
