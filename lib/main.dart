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
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: const Text(
            'السيرة الذاتية',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Column(
                    children: const [
                      SizedBox(height: 20),
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.blueGrey,
                        child: Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 50,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Ahmed Amrah",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "En",
                        style: TextStyle(fontSize: 16, color: Colors.black54),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),
                const Divider(color: Colors.blueGrey),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Email:",
                      style: TextStyle(fontSize: 16, color: Colors.blueGrey),
                    ),
                    Text("Ahmed@gmail.com"),
                  ],
                ),
                const Divider(color: Colors.blueGrey),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Phone:",
                      style: TextStyle(fontSize: 16, color: Colors.blueGrey),
                    ),
                    Text("777777777"),
                  ],
                ),
                const Divider(color: Colors.blueGrey),
                const SizedBox(height: 20),
                const Center(
                  child: Text(
                    "المهارات",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Center(
                  child: Text(
                    "• Flutter Development\n• UI/UX Design\n• Database Management\n• Teamwork & Communication",
                    textAlign: TextAlign.center,
                  ),
                ),
                const Divider(color: Colors.blueGrey),

                const SizedBox(height: 20),
                const Center(
                  child: Text(
                    "المؤهلات العلمية",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Center(
                  child: Text(
                    "بكالوريوس تقنية معلومات - جامعة سيئون\n2022 - 2026",
                    textAlign: TextAlign.center,
                  ),
                ),
                const Divider(color: Colors.blueGrey),

                const SizedBox(height: 20),
                const Center(
                  child: Text(
                    "المؤهلات العملية",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Center(
                  child: Text(
                    "• تدريب عملي في تطوير تطبيقات Flutter لمدة 6 أشهر.\n"
                    "• تنفيذ مشروع تخرج (نظام بوت الرد الآلي على الطلاب) باستخدام الذكاء الاصطناعي.\n"
                    "• خبرة في إدارة قواعد البيانات (MySQL و Firebase).\n"
                    "• عمل ضمن فرق برمجية طلابية لتنفيذ مشاريع مشتركة.",
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
