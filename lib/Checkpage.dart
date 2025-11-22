import 'package:flutter/material.dart';

class Checkpage extends StatelessWidget {
  const Checkpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.check_box, size: 30, color: Colors.grey),
          SizedBox(height: 20),
          Text("Checkbox ", style: TextStyle(fontSize: 24, color: Colors.grey)),
        ],
      ),
    );
  }
}
