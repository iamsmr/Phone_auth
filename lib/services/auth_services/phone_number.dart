import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:phone_auth/services/auth_services/otp_page.dart';

class AuthServices {
  FirebaseAuth _auth = FirebaseAuth.instance;
  Future continueWithPhoneNumber(String phoneNumber,BuildContext context) async {
    try {
      return _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (AuthCredential authCredential) async {
          // Navigator.of(context).pop();
          UserCredential result =
              await _auth.signInWithCredential(authCredential);
          return userFormFirebaseUser(result.user);
        },
        verificationFailed: (FirebaseAuthException firebaseAuthException) {
          print(firebaseAuthException.message);
        },
        codeSent: (String verificationId, [int forceResendingToken]) {
          // OtpPage(verificationId: verificationId, phoneNumber: phoneNumber);
         Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (_) => OtpPage(verificationId: verificationId)),
        );
        },

        timeout: Duration(seconds: 60),
        codeAutoRetrievalTimeout: (String verificationId) {
          verificationId = verificationId;
          print(verificationId);
          print("Timout");
        },
      );
    } catch (e) {
      print(e.message);
    }
  }

  Future conformPhoneNumber(
      verificationId, String otp, BuildContext context) async {
    try {
      AuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: otp);

      UserCredential result = await _auth.signInWithCredential(credential);
      Navigator.pop(context);
      return userFormFirebaseUser(result.user);
    } catch (e) {
      print(e);
    }
  }

  User userFormFirebaseUser(User user) {
    return user != null ? user : null;
  }

  Stream<User> get authChange {
    return _auth.authStateChanges().map(userFormFirebaseUser);
  }

  Future logout() async {
    return await _auth.signOut();
  }
}
