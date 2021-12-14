import 'genre.dart';
import 'package:json_annotation/json_annotation.dart';

part 'track.g.dart';

@JsonSerializable()
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

  factory Track.fromJson(Map<String, dynamic> json) => _$TrackFromJson(json);

  Map<String, dynamic> toJson() => _$TrackToJson(this);
}
