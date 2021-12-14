import 'package:json_annotation/json_annotation.dart';
import 'user.dart';
import 'track.dart';

part 'playlist.g.dart';

@JsonSerializable()
class Playlist {
  Playlist({
    required this.id,
    required this.public,
    required this.name,
    required this.user,
    required this.tracks,
  });
  final int id;
  final bool public;
  final String name;
  final User user;
  final List<Track> tracks;

  factory Playlist.fromJson(Map<String, dynamic> json) => _$PlaylistFromJson(json);

  Map<String, dynamic> toJson() => _$PlaylistToJson(this);
}
