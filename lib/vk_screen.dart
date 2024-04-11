import 'package:flutter/material.dart';

class VkScreen extends StatefulWidget {
  const VkScreen({super.key});

  @override
  State<VkScreen> createState() => _VkScreenState();
}

class _VkScreenState extends State<VkScreen> {
  int selectedIndex = 0;

  List<Widget> widgets = [
    Text('Все'),
    Text('Архивные'),
    Text('Удаленные'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NavigationDrawer'),
      ),
      body: Center(child: widgets[selectedIndex]),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration:
                  BoxDecoration(color: Color.fromARGB(255, 98, 161, 213)),
              child: Center(
                  child: Text(
                'Шапка',
                style: TextStyle(fontSize: 24),
              )),
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('Все сообщения'),
              onTap: () {
                setState(() {
                  selectedIndex = 0;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.messenger_outline),
              title: Text('Архивные сообщения'),
              onTap: () {
                setState(() {
                  selectedIndex = 1;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.message_rounded),
              title: Text('Удаленные сообщения'),
              onTap: () {
                setState(() {
                  selectedIndex = 2;
                });
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
