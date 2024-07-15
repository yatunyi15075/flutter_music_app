import 'package:flutter/material.dart';
import 'package:music_app/views/pages/playing.dart';

class DownloadsPage extends StatelessWidget {
  final List<Map<String, String>> downloadedSongs = [
    {"title": "Inside Out", "artist": "The Chainsmokers, Charlee"},
    {"title": "Young", "artist": "The Chainsmokers"},
    {"title": "Beach House", "artist": "The Chainsmokers"},
    {"title": "Kills You Slowly", "artist": "The Chainsmokers, Word"},
    {"title": "Setting Fires", "artist": "The Chainsmokers, XYLO"},
    {"title": "Somebody", "artist": "The Chainsmokers, Drew"},
    {"title": "Thunder", "artist": "Imagine Dragons, Summer"},
    {"title": "High on Life", "artist": "Martin Garrix, Bonn"},
    {"title": "FRIENDS", "artist": "Marshmello, Anne-Marie"},
    {"title": "Crazy On", "artist": "Artist Name"},
    {"title": "Bet My Heart", "artist": "Artist Name"},
    {"title": "Carry On", "artist": "Kygo, Rita Ora, Detective Pikachu"},
    // Add more songs as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Downloads'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '210 songs downloaded',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 8),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: Icon(Icons.sort),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: downloadedSongs.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MusicPlayerPage(),
                        ));
                  },
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://picsum.photos/50?random=$index'),
                    ),
                    title: Text(downloadedSongs[index]['title']!),
                    subtitle: Text(downloadedSongs[index]['artist']!),
                    trailing: IconButton(
                      icon: Icon(Icons.more_vert),
                      onPressed: () {
                        // Handle more options
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
