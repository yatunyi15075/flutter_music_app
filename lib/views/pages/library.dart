import 'package:flutter/material.dart';
import 'package:music_app/views/pages/Lliked_songs.dart';
import 'package:music_app/views/pages/downloads.dart';
import 'package:music_app/views/pages/playing.dart';

class LibraryPage extends StatelessWidget {
  final List<Map<String, String>> recentlyPlayed = [
    {"title": "Inside Out", "subtitle": "The Chainsmokers, Charlee"},
    {"title": "Young", "subtitle": "The Chainsmokers"},
    {"title": "Beach House", "subtitle": "The Chainsmokers, Sick Boy"},
    {
      "title": "Kills You Slowly",
      "subtitle": "The Chainsmokers, World War Joy"
    },
    {"title": "Setting Fires", "subtitle": "The Chainsmokers, XYLO"},
    {"title": "Somebody", "subtitle": "The Chainsmokers, Drew Love"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Your Library', style: TextStyle(color: Colors.white)),
      ),
      body: Stack(
        children: [
          // Background image
          // Main content
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Your Library',
                      style: TextStyle(color: Colors.white, fontSize: 24)),
                  SizedBox(height: 16),
                  GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      _buildLibraryItem(
                          Icons.favorite, 'Liked Songs', '120 songs', () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LikedSongsPage(),
                            ));
                      }),
                      _buildLibraryItem(
                        Icons.download,
                        'Downloads',
                        '210 songs',
                        () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DownloadsPage(),
                              ));
                        },
                      ),
                      _buildLibraryItem(
                        Icons.playlist_play, 'Playlists',
                          '12 playlists', () {}),
                      _buildLibraryItem(
                        Icons.person,
                        'Artists',
                        '3 artists',
                        () {},
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text('Recently Played',
                      style: TextStyle(color: Colors.white, fontSize: 18)),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MusicPlayerPage(),
                          ));
                    },
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: recentlyPlayed.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Icon(
                            Icons.music_note,
                            color: Colors.white,
                          ),
                          title: Text(
                            recentlyPlayed[index]["title"]!,
                            style: TextStyle(color: Colors.white),
                          ),
                          subtitle: Text(
                            recentlyPlayed[index]["subtitle"]!,
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          trailing: Icon(
                            Icons.more_vert,
                            color: Colors.white,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLibraryItem(
    IconData icon,
    String title,
    String subtitle,
    final onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.grey[850],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: 40,
            ),
            SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 4),
            Text(
              subtitle,
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
