import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();

  void _copyText() {
    setState(() {
      _controller2.text = _controller1.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      // الصفحة الرئيسية
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller1,
              decoration: InputDecoration(
                labelText: "Enter Text",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _controller2,
              readOnly: true,
              decoration: InputDecoration(
                labelText: "Output",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _copyText,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blueGrey),
              child: const Text("Print Value"),
            ),
          ],
        ),
      ),

      // صفحة البحث
      ListView(
        children: const [
          ListTile(title: Text("Item 1"), leading: Icon(Icons.search)),
          ListTile(title: Text("Item 2"), leading: Icon(Icons.search)),
          ListTile(title: Text("Item 3"), leading: Icon(Icons.search)),
          ListTile(title: Text("Item 4"), leading: Icon(Icons.search)),
        ],
      ),

      // صفحة الإعدادات
      const Center(
        child: Text("Settings Page", style: TextStyle(fontSize: 24)),
      ),

      // صفحة الحساب
      const Center(child: Text("Account Page", style: TextStyle(fontSize: 24))),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text("Bottom Navigation App"),
      ),

      body: pages[_currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.blueGrey,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Account"),
        ],
      ),
    );
  }
}
