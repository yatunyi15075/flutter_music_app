import 'package:flutter/material.dart';

class ThemeSelectionPage extends StatelessWidget {
  final List<String> themeNames = [
    "River bank",
    "Black panther",
    "Mic lab",
    "Fire theme",
    "Getty theme",
    "Kitty theme",
    "Mobile theme",
    "Silent theme",
    "Cassanova",
    "Disk Joker",
    "Alabama theme",
    "Jazz Vibes",
    "Night Owl",
    "Retro Wave",
    "Sunset Glow",
    "Ocean Breeze",
    "Mountain Peak",
    "Urban Jungle",
    "Vintage Vinyl",
    "Cyberpunk",
    "Chill Beats",
    "Rockstar",
    "Classical Harmony",
    "Techno Beat",
    "Acoustic Soul",
    "Electronic Pulse",
    "Indie Groove",
    "Folk Melody",
    "Hip Hop Flow",
    "Reggae Rhythms",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Theme'),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: themeNames.length,
        itemBuilder: (context, index) {
          return ThemeTile(
            name: themeNames[index],
            imageUrl: 'https://picsum.photos/200?random=$index',
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () {
            // Handle the done action
          },
          child: Text('Done'),
        ),
      ),
    );
  }
}

class ThemeTile extends StatelessWidget {
  final String name;
  final String imageUrl;

  const ThemeTile({
    Key? key,
    required this.name,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle the theme selection
      },
      child: GridTile(
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black54,
          title: Text(
            name,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
