import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String id;
  String name;
  String email;
  String photoURL;
  Timestamp createdAt;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.photoURL,
    required this.createdAt,
  });

  // UserModel.fromDocumentSnapShot({required DocumentSnapshot doc}) {
  //   id = doc.id;
  //   name = doc['name'];
  //   email = doc['email'];
  // }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'name': name});
    result.addAll({'email': email});
    result.addAll({'photo_url': photoURL});
    result.addAll({'created_at': createdAt});

    return result;
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      photoURL: map['photo_url'] ?? '',
      createdAt: map['created_at'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(id: $id, name: $name, email: $email, photoURL: $photoURL, createdAt: $createdAt)';
  }
}
