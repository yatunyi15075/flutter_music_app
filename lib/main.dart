import 'package:flutter/material.dart';
import 'package:music_app/views/pages/bottomnav.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: BottomNav(),
    );
  }
}
