// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'track.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Track _$TrackFromJson(Map<String, dynamic> json) => Track(
      id: json['id'] as int,
      year: json['year'] as int,
      artist: json['artist'] as String,
      album: json['album'] as String,
      name: json['name'] as String,
      genre: Genre.fromJson(json['genre'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TrackToJson(Track instance) => <String, dynamic>{
      'id': instance.id,
      'year': instance.year,
      'artist': instance.artist,
      'album': instance.album,
      'name': instance.name,
      'genre': instance.genre,
    };
