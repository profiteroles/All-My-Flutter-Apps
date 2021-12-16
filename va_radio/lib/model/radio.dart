import 'dart:convert';

import 'package:collection/collection.dart';

class VARadioList {
  final List<RadioStation> radios;
  VARadioList({
    required this.radios,
  });

  VARadioList copyWith({
    List<RadioStation>? radios,
  }) {
    return VARadioList(
      radios: radios ?? this.radios,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'radios': radios.map((x) => x.toMap()).toList()});

    return result;
  }

  factory VARadioList.fromMap(Map<String, dynamic> map) {
    return VARadioList(
      radios: List<RadioStation>.from(map['radios']?.map((x) => RadioStation.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory VARadioList.fromJson(String source) => VARadioList.fromMap(json.decode(source));

  @override
  String toString() => 'VARadioList(radios: $radios)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is VARadioList && listEquals(other.radios, radios);
  }

  @override
  int get hashCode => radios.hashCode;
}

class RadioStation {
  final int id;
  final int order;
  final String name;
  final String tagline;
  final String desc;
  final String url;
  final String category;
  final String icon;
  final String image;

  RadioStation({
    required this.id,
    required this.order,
    required this.name,
    required this.tagline,
    required this.desc,
    required this.url,
    required this.category,
    required this.icon,
    required this.image,
  });

  RadioStation copyWith({
    int? id,
    int? order,
    String? name,
    String? tagline,
    String? desc,
    String? url,
    String? category,
    String? icon,
    String? image,
  }) {
    return RadioStation(
      id: id ?? this.id,
      order: order ?? this.order,
      name: name ?? this.name,
      tagline: tagline ?? this.tagline,
      desc: desc ?? this.desc,
      url: url ?? this.url,
      category: category ?? this.category,
      icon: icon ?? this.icon,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'order': order});
    result.addAll({'name': name});
    result.addAll({'tagline': tagline});
    result.addAll({'desc': desc});
    result.addAll({'url': url});
    result.addAll({'category': category});
    result.addAll({'icon': icon});
    result.addAll({'image': image});

    return result;
  }

  factory RadioStation.fromMap(Map<String, dynamic> map) {
    return RadioStation(
      id: map['id']?.toInt() ?? 0,
      order: map['order']?.toInt() ?? 0,
      name: map['name'] ?? '',
      tagline: map['tagline'] ?? '',
      desc: map['desc'] ?? '',
      url: map['url'] ?? '',
      category: map['category'] ?? '',
      icon: map['icon'] ?? '',
      image: map['image'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory RadioStation.fromJson(String source) => RadioStation.fromMap(json.decode(source));

  @override
  String toString() {
    return 'RadioStation(id: $id, order: $order, name: $name, tagline: $tagline, desc: $desc, url: $url, category: $category, icon: $icon, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RadioStation && other.id == id && other.order == order && other.name == name && other.tagline == tagline && other.desc == desc && other.url == url && other.category == category && other.icon == icon && other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^ order.hashCode ^ name.hashCode ^ tagline.hashCode ^ desc.hashCode ^ url.hashCode ^ category.hashCode ^ icon.hashCode ^ image.hashCode;
  }
}
