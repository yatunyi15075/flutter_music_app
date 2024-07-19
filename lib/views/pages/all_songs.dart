import 'dart:math';
import 'package:flutter/material.dart';
import 'shazam_service.dart';

class AllSongsPage extends StatefulWidget {
  @override
  _AllSongsPageState createState() => _AllSongsPageState();
}

class _AllSongsPageState extends State<AllSongsPage> {
  List<Song> songs = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchSongs();
  }

  Future<void> _fetchSongs() async {
    try {
      final fetchedSongs = await ShazamService.fetchSongs('metallica');
      setState(() {
        songs = fetchedSongs;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      // Handle error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('All Songs'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Column(
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
