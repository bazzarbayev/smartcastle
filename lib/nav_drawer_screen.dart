import 'package:flutter/material.dart';

class NavDrawerScreen extends StatefulWidget {
  const NavDrawerScreen({super.key});

  @override
  State<NavDrawerScreen> createState() => _NavDrawerScreenState();
}

class _NavDrawerScreenState extends State<NavDrawerScreen> {
  int _selectedIndex = 0;

  final List<Widget> widgets = [
    Text(
      'Index 0: Test',
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    ),
    Text(
      'Index 1: Business',
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    ),
    Text(
      'Index 2: School',
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Nav Drawer Menu')),
      body: Center(
        child: widgets[_selectedIndex],
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              // width: double.infinity,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text('Drawer Header'),
              ),
            ),
            ListTile(
              title: const Text('Home'),
              selected: _selectedIndex == 0,
              onTap: () {
                // Update the state of the app

                setState(() {
                  _selectedIndex = 0;
                });

                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Business'),
              selected: _selectedIndex == 1,
              selectedColor: Colors.amber,
              onTap: () {
                // Update the state of the app

                setState(() {
                  _selectedIndex = 1;
                });
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('School'),
              selected: _selectedIndex == 2,
              onTap: () {
                // Update the state of the app

                setState(() {
                  _selectedIndex = 2;
                });
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
