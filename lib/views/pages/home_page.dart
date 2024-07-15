import 'package:flutter/material.dart';
import 'package:music_app/views/pages/playing.dart';
import 'package:music_app/views/pages/settings.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      '👋 Hi MARENDE,',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SettingsPage(),
                            ));
                      },
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://randomuser.me/api/portraits/men/32.jpg'),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Text(
                  'Good Evening',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ChoiceChip(label: Text('For you'), selected: true),
                    ChoiceChip(label: Text('Relax'), selected: false),
                    ChoiceChip(label: Text('Workout'), selected: false),
                    ChoiceChip(label: Text('Travel'), selected: false),
                  ],
                ),
                SizedBox(height: 16),
                Text(
                  'Featuring Today',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Container(
                  height: 200,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      FeatureCard(
                        imageUrl: 'https://picsum.photos/200/300?random=1',
                        title: 'ENGLISH SONGS',
                      ),
                      FeatureCard(
                        imageUrl: 'https://picsum.photos/200/300?random=2',
                        title: 'SPANISH SONGS',
                      ),
                      FeatureCard(
                        imageUrl: 'https://picsum.photos/200/300?random=3',
                        title: 'CLASSICAL SONGS',
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Recently Played',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text('See more'),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Container(
                  height: 120,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      RecentlyPlayedCard(
                        imageUrl: 'https://picsum.photos/200/300?random=4',
                        title: 'Inside Out',
                        artist: 'The Chainsmokers',
                      ),
                      RecentlyPlayedCard(
                        imageUrl: 'https://picsum.photos/200/300?random=5',
                        title: 'Young',
                        artist: 'The Chainsmokers',
                      ),
                      RecentlyPlayedCard(
                        imageUrl: 'https://picsum.photos/200/300?random=6',
                        title: 'Beach House',
                        artist: 'The Chainsmokers',
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                NowPlayingCard(
                  imageUrl: 'https://picsum.photos/200/300?random=7',
                  title: 'Inside Out',
                  artist: 'The Chainsmokers, Charlee',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FeatureCard extends StatelessWidget {
  final String imageUrl;
  final String title;

  FeatureCard({required this.imageUrl, required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MusicPlayerPage(),
            ));
      },
      child: Container(
        margin: EdgeInsets.only(right: 8),
        width: 140,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(imageUrl, width: 140, height: 100, fit: BoxFit.cover),
            SizedBox(height: 8),
            Text(title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}

class RecentlyPlayedCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String artist;

  RecentlyPlayedCard(
      {required this.imageUrl, required this.title, required this.artist});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MusicPlayerPage(),
            ));
      },
      child: Container(
        margin: EdgeInsets.only(right: 8),
        width: 120,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(imageUrl, width: 120, height: 80, fit: BoxFit.cover),
            SizedBox(height: 8),
            Text(title,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            Text(artist, style: TextStyle(fontSize: 12, color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}

class NowPlayingCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String artist;

  NowPlayingCard(
      {required this.imageUrl, required this.title, required this.artist});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Image.network(imageUrl, width: 60, height: 60, fit: BoxFit.cover),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              Text(artist, style: TextStyle(fontSize: 14, color: Colors.grey)),
            ],
          ),
          Spacer(),
          Icon(Icons.play_arrow, size: 30, color: Colors.white),
        ],
      ),
    );
  }
}
