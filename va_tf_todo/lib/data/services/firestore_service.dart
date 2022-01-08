import 'dart:io';
import 'package:path/path.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:va_tf_todo/data/models/task.dart';
import 'package:va_tf_todo/data/models/user.dart';

class FirestoreService {
  final _storage = FirebaseStorage.instance;
  final CollectionReference _db = FirebaseFirestore.instance.collection('users');

  Future<void> setUser(Map<String, dynamic> map) => _db.doc(map['id']).set(map);

  Future<UserModel> getUser(String id) {
    debugPrint('FirestoreService - getUser is Called');
    return _db.doc(id).get().then((doc) => UserModel.fromJson(doc.data() as Map<String, dynamic>));
  }

  Future<void> updateUser(String id, Map<String, dynamic> data) async {
    debugPrint('FirestoreService - updateUser is Called');
    await _db.doc(id).update(data);
  }

  Future<String> uploadProfileImage(File file, String uid) async {
    debugPrint('FirestoreService - uploadProfileImage is Called');
    try {
      final fileName = basename(file.path);

      print(fileName);

      Reference ref = _storage.ref().child('uniQx/users/$uid/$fileName');
      final uploadFile = await ref.putFile(file).whenComplete(() => print('success'));

      final url = await uploadFile.ref.getDownloadURL();
      print(url);
      print('________END_______');
      return url;
    } catch (e) {
      print(e);
      return '';
    }
  }

  Future<String> setTaskList(Map<String, dynamic> json, String userId) {
    debugPrint('FirestoreService - setTaskList is Called');
    return _db.doc(userId).collection('tasks_list').add(json).then((value) {
      value.update({"id": value.id});
      return value.id;
    });
  }

  Future<List<TasksList>> getTaskList(String userId) async {
    debugPrint('FirestoreService - getTaskList is Called');
    var list = <TasksList>[];
    try {
      var userData = await _db.doc(userId).collection('tasks_list').get().then((QuerySnapshot snapshot) {
        snapshot.docs.forEach((e) => list.add(TasksList.fromJson(e.data() as Map<String, dynamic>)));
      });
    } catch (e) {
      debugPrint(e.toString());
    }
    return list;
  }

//TODO: Sort this shit out
  Future<void> updateTaskList(List<Map<String, dynamic>> list, String userId) async {
    try {
      list.forEach((task) async => await _db.doc(userId).collection('tasks_list').doc().update(task));
      // await _db.doc(userId).collection('tasks_list').get().then((value) {
      //       value.docs.forEach((doc) => doc.reference.update(task));
      // }));

      // await _db.doc(userId).collection('tasks_list').get().then((value) => value.docs.forEach((doc) {
      //       doc.reference.update());
      // doc.reference.set(list[0]);
      // print(doc.reference.collection('collectionPath'))
      // }));
    } catch (e) {
      debugPrint(e.toString());
    }

    // return _db.doc(userId).collection('tasks_list').add(json).then((value) {
    //   value.update({"id": value.id});
    // return value.id;
    // });
  }
}
