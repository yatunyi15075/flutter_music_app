import 'package:flutter/material.dart';
import 'package:music_app/views/pages/home_page.dart';
import 'package:music_app/views/pages/library.dart';
import 'package:music_app/views/pages/search.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  late List<Widget> pages;

  int currentTabIndex = 0;

  @override
  void initState() {
    pages = [HomePage(), SearchPage(), LibraryPage()];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            currentTabIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
              icon: Icon(Icons.library_music), label: 'Your Library'),
        ],
      ),
      body: pages[currentTabIndex],
    );
  }
}
