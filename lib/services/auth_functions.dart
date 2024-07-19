import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:pingolearn_task/main.dart';
import 'package:pingolearn_task/modules/comments_module/screen/comments_screen.dart';
import 'package:pingolearn_task/utils/Toast.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

signUp(String emailAddress, String password, String displayName,
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
      // 'password': password,
    });

    print('Signed up and data stored in Firestore.');
    ToastManager.showToast("Signed Up Successfully", context);
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const CommentsScreen(),
        ));
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
      ToastManager.showToast("The password provided is too weak.", context);
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
      ToastManager.showToast(
          "The account already exists for that email.", context);
    }
  } catch (e) {
    print(e);
  }
}

signIn(String emailAddress, String password, BuildContext context) async {
  try {
    final credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: emailAddress, password: password);
    print('Signed in......');
    ToastManager.showToast("Signed in Sucessfully", context);
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const CommentsScreen(),
        ));
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
      ToastManager.showToast('No user found for that email.', context);
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
      ToastManager.showToast('Wrong password provided for that user.', context);
    }
  }
}
