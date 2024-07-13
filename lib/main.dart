import 'package:flutter/material.dart';
import 'package:music_app/views/pages/home_page.dart';
import 'package:music_app/views/pages/library.dart';
import 'package:music_app/views/pages/playing.dart';
import 'package:music_app/views/pages/search.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: LibraryPage(),
    );
  }
}
