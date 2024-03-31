import 'package:flutter/material.dart';

class HorizontalList extends StatefulWidget {
  const HorizontalList({super.key});

  @override
  State<HorizontalList> createState() => _HorizontalListState();
}

class _HorizontalListState extends State<HorizontalList> {
  ScrollController _scrollController = ScrollController();

  List<String> tags = [
    "Tag 1",
    "Tag 2",
    "Tag 3",
    "Tag 4",
    "Tag 5",
    "Tag 6",
    "Tag 7",
    "Tag 8",
    "Tag 9",
    "Tag 10",
    "Tag 11",
    "Tag 12",
    "Tag 13",
    // Add more tags as needed
  ];

  int selectedIndex = 0;
  GlobalKey _containerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tag List"),
      ),
      body: ListView.builder(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
              _scrollToSelectedTag(index);
            },
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                double containerWidth = constraints.maxWidth;
                print('widthhh: $containerWidth');
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  margin: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: selectedIndex == index ? Colors.blue : Colors.grey,
                  ),
                  child: Text(
                    '100',
                    style: TextStyle(color: Colors.white),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  void _scrollToSelectedTag(int index) {
    // Calculate the offset to center the selected tag
    double screenWidth = MediaQuery.of(context).size.width;
    double itemWidth = 100; // Adjust according to your tag item width
    double targetOffset =
        (index * itemWidth) - (screenWidth / 2) + (itemWidth / 2);

    // Ensure that the target offset stays within the bounds of the list
    double maxOffset = _scrollController.position.maxScrollExtent;
    double minOffset = 0;

    // Adjust the target offset if it goes beyond the bounds
    if (targetOffset > maxOffset) {
      targetOffset = maxOffset;
    } else if (targetOffset < minOffset) {
      targetOffset = minOffset;
    }

    // Scroll to the calculated offset
    _scrollController.animateTo(
      targetOffset,
      duration: Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }
}
