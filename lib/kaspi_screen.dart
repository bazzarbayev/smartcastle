import 'package:flutter/material.dart';
import 'package:lesson4/categories_screen.dart';
import 'package:lesson4/profile2.dart';

class KaspiScreen extends StatefulWidget {
  const KaspiScreen({super.key});

  @override
  State<KaspiScreen> createState() => _KaspiScreenState();
}

class _KaspiScreenState extends State<KaspiScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: [
          Text('Home'),
          CategoriesScreen(),
          Profile2(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Главная'),
          BottomNavigationBarItem(
              icon: Icon(Icons.business), label: 'Категория'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Профиль'),
        ],
        currentIndex: selectedIndex,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.green,
        backgroundColor: Colors.yellow,
      ),
    );
  }
}
