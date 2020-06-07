import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  FirebaseUser user;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<FirebaseUser> get authstate {
    return _auth.onAuthStateChanged;
  }

  Future<String> getUserPhone() async {
    user = await _auth.currentUser();
    return user.phoneNumber;
  }

  signIn(AuthCredential authCreds) async {
    try {
      AuthResult authResult = await _auth.signInWithCredential(authCreds);
      this.user = authResult.user;
      _registerUsertoDB();
    } catch (err) {
      print(err.toString());
    }
  }

  signInWithOTP(smsCode, verId) {
    AuthCredential authCreds = PhoneAuthProvider.getCredential(
        verificationId: verId, smsCode: smsCode);
    this.user = signIn(authCreds);
  }

  _registerUsertoDB() {
    CollectionReference userRef = Firestore.instance.collection('users');
    userRef.document(user.uid).setData({
      'phone': user.phoneNumber,
    });
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }
}
