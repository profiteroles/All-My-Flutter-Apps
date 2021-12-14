// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genre.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Genre _$GenreFromJson(Map<String, dynamic> json) => Genre(
      // id: json['id'] as int,
      // parent: json['parent'] as int?,
      name: json['name'] as String,
      icon: json['icon'] as String,
      extra: json['extra'] as String?,
      created_at: json['created_at'] == null ? null : DateTime.parse(json['created_at'] as String),
      updated_at: json['updated_at'] == null ? null : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$GenreToJson(Genre instance) => <String, dynamic>{
      // 'id': instance.id,
      // 'parent': instance.parent,
      'name': instance.name,
      'icon': instance.icon,
      'extra': instance.extra,
      'created_at': instance.created_at?.toIso8601String(),
      'updated_at': instance.updated_at?.toIso8601String(),
    };
