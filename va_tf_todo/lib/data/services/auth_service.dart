import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleAuth = GoogleSignIn();

  User? user() => _auth.currentUser;

  Stream<User?> currentUser() => _auth.userChanges();
  Future<void> deleteUser() => _auth.currentUser!.delete();
  Future<void> recoverPass(String email) => _auth.sendPasswordResetEmail(email: email);
  Future<void> updatePassword(String newPassword) => _auth.currentUser!.updatePassword(newPassword);
  Future<UserCredential> loginEmail(String email, password) => _auth.signInWithEmailAndPassword(email: email, password: password);
  Future<UserCredential> signUpEmail(String email, password) => _auth.createUserWithEmailAndPassword(email: email, password: password);
  Future<UserCredential> signWithCredential(AuthCredential credential) => _auth.signInWithCredential(credential);
  Future<void> signOut() async {
    await _auth.signOut();
    await _googleAuth.signOut();
  }
}
