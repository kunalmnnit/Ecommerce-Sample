import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  FirebaseUser user;

  signOut() {
    FirebaseAuth.instance.signOut();
  }

  signIn(AuthCredential authCreds) async {
    try {
      AuthResult authResult =
          await FirebaseAuth.instance.signInWithCredential(authCreds);
      this.user = authResult.user;
    } catch (err) {
      print(err.toString());
    }
  }

  signInWithOTP(smsCode, verId, context) {
    AuthCredential authCreds = PhoneAuthProvider.getCredential(
        verificationId: verId, smsCode: smsCode);
    this.user = signIn(authCreds);
    _registerUsertoDB(context);
  }

  _registerUsertoDB(context) async {
    CollectionReference userRef = Firestore.instance.collection('users');
    userRef.document(user.uid).setData({
      'phone': user.phoneNumber,
    });
    Navigator.pushReplacementNamed(context, 'main');
  }
}
