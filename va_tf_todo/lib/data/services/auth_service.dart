import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? user() => _auth.currentUser;
  Stream<User?> currentUser() => _auth.userChanges();
  Future<void> signOut() => _auth.signOut();
  Future<void> deleteUser() => _auth.currentUser!.delete();
  Future<void> recoverPass(String email) => _auth.sendPasswordResetEmail(email: email);
  Future<void> updatePassword(String newPassword) => _auth.currentUser!.updatePassword(newPassword);
  Future<UserCredential> loginEmail(String email, password) => _auth.signInWithEmailAndPassword(email: email, password: password);
  Future<UserCredential> signUpEmail(String email, password) => _auth.createUserWithEmailAndPassword(email: email, password: password);
}
