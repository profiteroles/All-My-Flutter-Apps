import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:va_tf_todo/data/models/user.dart';

class FirestoreService {
  final CollectionReference _db = FirebaseFirestore.instance.collection('users');

  Future<void> setUser(Map<String, dynamic> map) => _db.doc(map['id']).set(map);

  Future<UserModel> getUser(String id) {
    debugPrint('FirestoreService - getUser is Called');
    return _db.doc(id).get().then((doc) => UserModel.fromJson(doc.data() as Map<String, dynamic>));
  }

  Future<void> setTaskList(Map<String, dynamic> json, String userId) {
    debugPrint('FirestoreService - setTaskList is Called');
    return _db.doc(userId).collection('tasks_lists').add(json);
  }
}
