// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playlist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Playlist _$PlaylistFromJson(Map<String, dynamic> json) => Playlist(
      id: json['id'] as int,
      public: json['public'] as bool,
      name: json['name'] as String,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      tracks: (json['tracks'] as List<dynamic>)
          .map((e) => Track.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PlaylistToJson(Playlist instance) => <String, dynamic>{
      'id': instance.id,
      'public': instance.public,
      'name': instance.name,
      'user': instance.user,
      'tracks': instance.tracks,
    };
