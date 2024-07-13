import 'package:flutter/material.dart';

class MusicPlayerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Icon(Icons.expand_more, color: Colors.white),
                  Spacer(),
                  Icon(Icons.more_vert, color: Colors.white),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network(
                        'https://picsum.photos/400/400?random=8', // Random image URL
                        width: double.infinity,
                        height: 300,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Let me see the dark sides as well as the bright',
                    style: TextStyle(fontSize: 16, color: Colors.white70),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Inside Out',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'The Chainsmokers, Charlee',
                    style: TextStyle(fontSize: 18, color: Colors.white70),
                  ),
                  SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('0:25', style: TextStyle(color: Colors.white70)),
                        Expanded(
                          child: Slider(
                            value: 25,
                            min: 0,
                            max: 215,
                            onChanged: (value) {},
                            activeColor: Colors.white,
                            inactiveColor: Colors.white30,
                          ),
                        ),
                        Text('3:15', style: TextStyle(color: Colors.white70)),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(Icons.favorite_border),
                        onPressed: () {},
                        color: Colors.white,
                      ),
                      IconButton(
                        icon: Icon(Icons.skip_previous),
                        onPressed: () {},
                        color: Colors.white,
                        iconSize: 36,
                      ),
                      IconButton(
                        icon: Icon(Icons.play_circle_filled),
                        onPressed: () {},
                        color: Colors.white,
                        iconSize: 64,
                      ),
                      IconButton(
                        icon: Icon(Icons.skip_next),
                        onPressed: () {},
                        color: Colors.white,
                        iconSize: 36,
                      ),
                      IconButton(
                        icon: Icon(Icons.share),
                        onPressed: () {},
                        color: Colors.white,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
