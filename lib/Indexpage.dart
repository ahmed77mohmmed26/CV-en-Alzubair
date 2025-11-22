import 'package:flutter/material.dart';
import 'Homepage.dart';
import 'Searchpage.dart';
import 'Setting.dart';
import 'Checkpage.dart';

class Indexpage extends StatefulWidget {
  const Indexpage({super.key});

  @override
  State<Indexpage> createState() => _IndexpageState();
}

class _IndexpageState extends State<Indexpage> {
  int _bottomNavbar = 0;
  List<Widget> _pages = [Homepage(), Searchpage(), Settingpage(), Checkpage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("الصفحة الرئيسية")),
      body: IndexedStack(index: _bottomNavbar, children: _pages),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _bottomNavbar,
        onTap: (index) {
          setState(() {
            _bottomNavbar = index;
          });
        },
        selectedItemColor: Colors.blue[800],
        unselectedItemColor: Colors.grey[600],
        items: [
          BottomNavigationBarItem(label: "الرئيسية", icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: "البحث", icon: Icon(Icons.search)),
          BottomNavigationBarItem(
            label: "الاعدادات",
            icon: Icon(Icons.settings),
          ),
          BottomNavigationBarItem(
            label: "Checkbox",
            icon: Icon(Icons.check_box),
          ),
        ],
      ),
    );
  }
}
