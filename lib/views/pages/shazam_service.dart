import 'dart:convert';
import 'package:http/http.dart' as http;

class ShazamService {
  static const String _apiKey = '41e05a3d3cmshcd1e39a1cdc9715p1b1f9cjsn9a358d2879ef';
  static const String _host = 'shazam-core.p.rapidapi.com';
  static const String _baseUrl = 'https://shazam-core.p.rapidapi.com/v1';

  static Future<List<Song>> fetchSongs(String query) async {
    final response = await http.get(
      Uri.parse('$_baseUrl/search/multi?query=$query&search_type=SONGS_ARTISTS&offset=0'),
      headers: {
        'x-rapidapi-host': _host,
        'x-rapidapi-key': _apiKey,
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List<Song> songs = [];
      for (var item in data['tracks']['hits']) {
        songs.add(Song.fromJson(item['track']));
      }
      return songs;
    } else {
      throw Exception('Failed to load songs');
    }
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

  factory Song.fromJson(Map<String, dynamic> json) {
    return Song(
      title: json['title'] ?? '',
      artist: json['subtitle'] ?? '',
      album: json['sections'][0]['metadata'][0]['text'] ?? '',
      coverUrl: json['images']['coverart'] ?? '',
    );
  }
}
