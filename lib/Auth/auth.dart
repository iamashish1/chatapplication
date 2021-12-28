import 'package:chatapplication/FireStroreRepo/datarepository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Auth with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  DataRepository _repo = DataRepository();

  Future<User?> createUserWithEmailAndPassword(
      String email, String pass) async {
    try {
      // ignore: unused_local_variable
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: pass);
      print(userCredential.user!.uid + 'niceeee');
      print(userCredential.user!.email! + 'niceeee');

      _repo.addUser(userCredential.user!.uid,
          email: userCredential.user!.email);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        // print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        // print('The account already exists for that email.');
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  Future<User?> signInWithEmailPassword(String email, String password) async {
    // User? user;

    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        // print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        // print('Wrong password provided.');
      }
    }

    // return user;
  }

  Future<String> signOut() async {
    await _auth.signOut();

    notifyListeners();

    return 'User signed out';
  }
}
