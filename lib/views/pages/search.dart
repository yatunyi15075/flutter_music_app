import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  final List<Map<String, String>> recentSearches = [
    {"title": "You (feat. Travis Scott)", "subtitle": "Song • Don Toliver"},
    {
      "title": "John Wick: Chapter 4 (Original Soundtrack)",
      "subtitle": "Album • Tyler Bates, Joel J. Richard"
    },
    {"title": "Maroon 5", "subtitle": "Artist"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: TextField(
          decoration: InputDecoration(
            hintText: 'Search songs, artist, album or playlist',
            hintStyle: TextStyle(color: Colors.grey),
            border: InputBorder.none,
          ),
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Stack(
        children: [
          // Recent searches list
          ListView.builder(
            itemCount: recentSearches.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Icon(Icons.music_note, color: Colors.white),
                title: Text(
                  recentSearches[index]["title"]!,
                  style: TextStyle(color: Colors.white),
                ),
                subtitle: Text(
                  recentSearches[index]["subtitle"]!,
                  style: TextStyle(color: Colors.grey),
                ),
                trailing: Icon(Icons.clear, color: Colors.white),
              );
            },
          ),
          // Clear history button
          Positioned(
            bottom: 20,
            right: 20,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
              ),
              onPressed: () {
                // Add clear history functionality here
              },
              child: Text('Clear history'),
            ),
          ),
        ],
      ),
    );
  }
}
