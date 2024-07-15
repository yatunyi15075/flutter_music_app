import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class AllSongsPage extends StatelessWidget {
  final List<Song> songs = List.generate(
    20,
    (index) => Song(
      title: 'Song Title $index',
      artist: 'Artist $index',
      album: 'Album $index',
      coverUrl: 'https://picsum.photos/200?random=$index',
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('All Songs'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  'https://picsum.photos/800/400?random=${Random().nextInt(100)}',
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Text(
                '${songs.length} songs',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: songs.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Image.network(songs[index].coverUrl,
                      width: 50, height: 50),
                  title: Text(songs[index].title,
                      style: TextStyle(color: Colors.white)),
                  subtitle: Text(
                      '${songs[index].artist} - ${songs[index].album}',
                      style: TextStyle(color: Colors.grey)),
                  trailing: Icon(Icons.more_vert, color: Colors.white),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Song {
  final String title;
  final String artist;
  final String album;
  final String coverUrl;

  Song({
    required this.title,
    required this.artist,
    required this.album,
    required this.coverUrl,
  });
}
