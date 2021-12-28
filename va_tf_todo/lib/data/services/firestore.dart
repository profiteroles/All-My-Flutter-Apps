import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:va_tf_todo/data/models/user.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Future<bool> createUser(UserModel user) async{
  //   try {
  //     await _firestore.collection("users").doc(user.id).set(
  //     )
  //   } catch (e) {
  //   }
  // }
}
