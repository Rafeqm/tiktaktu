import 'package:flutter/material.dart';

import 'package:tiktaktu/screens/main.dart';

void main() => runApp(const TiktaktuApp());

class TiktaktuApp extends StatelessWidget {
  const TiktaktuApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TikTaktu',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: const MainScreen(),
    );
  }
}
