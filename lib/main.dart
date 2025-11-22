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
      home: const TextFieldPage(),
    );
  }
}

class TextFieldPage extends StatefulWidget {
  const TextFieldPage({super.key});

  @override
  State<TextFieldPage> createState() => _TextFieldPageState();
}

class _TextFieldPageState extends State<TextFieldPage> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();

  void _login() {
    setState(() {
      _controller2.text = _controller1.text;
    });
  }

  void _navigate() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TowPage(name: _controller1.text)),
    );
  }

  void _navigate1() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TowPage1(name: _controller1.text),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 20),

            TextField(
              controller: _controller1,
              decoration: InputDecoration(
                labelText: 'Enter the Name',
                hintText: 'ahmed',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: _controller2,
              readOnly: true,
              decoration: InputDecoration(
                labelText: 'The Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blueGrey),
              onPressed: _login,
              child: const Text('Submit'),
            ),

            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blueGrey),
              onPressed: _navigate,
              child: const Text('Navigate'),
            ),

            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blueGrey),
              onPressed: _navigate1,
              child: const Text('Navigate 1'),
            ),
          ],
        ),
      ),
    );
  }
}

class TowPage extends StatelessWidget {
  final String name;

  const TowPage({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tow Page'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(child: Text(name, style: const TextStyle(fontSize: 24))),
    );
  }
}

class TowPage1 extends StatefulWidget {
  final String name;

  const TowPage1({super.key, required this.name});

  @override
  State<TowPage1> createState() => _TowPage1State();
}

class _TowPage1State extends State<TowPage1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tow Page 1'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(widget.name, style: const TextStyle(fontSize: 24)),

          const SizedBox(height: 10),
          const Text('data'),

          const SizedBox(height: 20),

          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blueGrey),
            onPressed: () => Navigator.pop(context),
            child: const Text('Back'),
          ),
        ],
      ),
    );
  }
}
