import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pingolearn_task/modules/comments_module/screen/comments_screen.dart';
import 'package:pingolearn_task/utils/Toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> signUp(String emailAddress, String password, String displayName,
    BuildContext context) async {
  try {
    final credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailAddress,
      password: password,
    );

    String uid = credential.user!.uid;
    await FirebaseFirestore.instance.collection('users').doc(uid).set({
      'email': emailAddress,
      'displayName': displayName,
    });

    print('Signed up and data stored in Firestore.');
    ToastManager.showToast("Signed Up Successfully", context);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CommentsScreen(),
      ),
    );
  } on FirebaseAuthException catch (e) {
    switch (e.code) {
      case 'weak-password':
        print('The password provided is too weak.');
        ToastManager.showToast("The password provided is too weak.", context);
        break;
      case 'email-already-in-use':
        print('The account already exists for that email.');
        ToastManager.showToast(
            "The account already exists for that email.", context);
        break;
      default:
        print('An error occurred during sign up: ${e.message}');
        ToastManager.showToast(
            'An error occurred during sign up: ${e.message}', context);
        break;
    }
  } catch (e) {
    print('An unexpected error occurred: $e');
    ToastManager.showToast('An unexpected error occurred: $e', context);
  }
}

Future<void> signIn(
    String emailAddress, String password, BuildContext context) async {
  try {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailAddress,
      password: password,
    );

    print('Signed in successfully.');
    ToastManager.showToast("Signed in Successfully", context);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CommentsScreen(),
      ),
    );
  } on FirebaseAuthException catch (e) {
    switch (e.code) {
      case 'user-not-found':
        print('No user found for that email.');
        ToastManager.showToast('No user found for that email.', context);
        break;
      case 'wrong-password':
        print('Wrong password provided for that user.');
        ToastManager.showToast(
            'Wrong password provided for that user.', context);
        break;
      default:
        print('An error occurred during sign in: ${e.message}');
        ToastManager.showToast(
            'An error occurred during sign in: ${e.message}', context);
        break;
    }
  } catch (e) {
    print('An unexpected error occurred: $e');
    ToastManager.showToast('An unexpected error occurred: $e', context);
  }
}
