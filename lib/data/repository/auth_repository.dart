import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../utils/utils.dart';

class AuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> loginWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      saveUserData(userCredential);
    } catch (e) {
      print(e);
    }
  }

  Future<void> saveUserData(UserCredential userCredential) async {
    try {
      final User? user = userCredential.user;
      if (user != null) {
        firestore.collection('Users').doc(user.uid).set({
          'user_name': user.displayName,
          'email': user.email,
        }).then((value) {
          Utils.showSnakeBar('User Saved', 'User Successfully Saved', Icons.info);
        }).onError((error, stackTrace) {
          Utils.showSnakeBar('Error', error.toString(), Icons.error);
        });
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      GoogleSignInAuthentication? googleAuth = await googleSignInAccount?.authentication;
      final AuthCredential credential =
          GoogleAuthProvider.credential(accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
      final UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
      saveUserData(userCredential);
    } on FirebaseAuthException catch (e) {
      Utils.showSnakeBar('Error', e.toString(), Icons.error);
    }
  }
}
