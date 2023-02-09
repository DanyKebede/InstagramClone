// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:insta_clone/util/snackbar.dart';

class FirebaseAuthMethods {
  //entry point
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // gets the current logged user
  User? get user => _auth.currentUser;

  //notifies any changes in user
  Stream<User?> get authState => FirebaseAuth.instance.authStateChanges();

  //Email Sign up
  Future<void> signUpWithEmail({
    required String userName,
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      UserCredential authResponse = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (authResponse.user!.uid.isNotEmpty) {
        showSuccessSnackBar(context, 'Successfully created');
      }
    } on FirebaseAuthException catch (e) {
      showErrorSnackBar(context, e.message!);
    }
  }

// Email login
  Future<void> loginWithEmail({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      UserCredential authResponse = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (authResponse.user!.uid.isNotEmpty) {
        showSuccessSnackBar(context, 'Successfully logged in');
      }
    } on FirebaseAuthException catch (e) {
      showErrorSnackBar(context, e.message!);
    }
  }

// Logged out
  Future<void> signOut(BuildContext context) async {
    try {
      await _auth.signOut();
    } on FirebaseAuthException catch (e) {
      showErrorSnackBar(context, e.message!);
    }
  }
}
