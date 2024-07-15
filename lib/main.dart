import 'package:flutter/material.dart';
import 'package:music_app/views/pages/all_songs.dart';
import 'package:music_app/views/pages/downloads.dart';
import 'package:music_app/views/pages/home_page.dart';
import 'package:music_app/views/pages/library.dart';
import 'package:music_app/views/pages/playing.dart';
import 'package:music_app/views/pages/search.dart';
import 'package:music_app/views/pages/settings.dart';
import 'package:music_app/views/pages/theme_selection.dart';

import 'views/pages/Lliked_songs.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: DownloadsPage(),
    );
  }
}
