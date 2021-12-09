import 'genre.dart';

class Track {
  Track({
    required this.id,
    required this.year,
    required this.artist,
    required this.album,
    required this.name,
    required this.genre,
  });
  final int id, year;
  final String artist, album, name;
  final Genre genre;
}
