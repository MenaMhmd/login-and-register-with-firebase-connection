import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final _auth = FirebaseAuth.instance;
  //replace authresult with usercreadintal
  Future<UserCredential> signup(String email, String password) async {
    final authresult = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    return authresult;
  }

  Future<UserCredential> signin(String email, String password) async {
    final authresult = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    return authresult;
  }
}
