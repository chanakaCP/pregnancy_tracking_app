import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:pregnancy_tracking_app/Screens/signUP/regitration.dart';
import 'package:pregnancy_tracking_app/Screens/home/homeScreen.dart';
import 'package:pregnancy_tracking_app/models/user.dart';
import 'package:pregnancy_tracking_app/shared/timeCalculate.dart';

class AuthService {
  String phoneNo;
  String verificationId;
  String status;
  User loginUser;
  TimeCalculate time = TimeCalculate();
  final firestoreInstance = Firestore.instance;

  Future<void> verifyPhone(User loginUser, BuildContext context) async {
    this.loginUser = loginUser;
    phoneNo = loginUser.mobileNumber;

    final PhoneCodeAutoRetrievalTimeout autoRetrieve = (String verId) {
      verificationId = verId;
    };

    final PhoneCodeSent smsCodeSent = (String verId, [int forceCodeResend]) {
      print("code send");
      verificationId = verId;
    };

    final PhoneVerificationCompleted verifiedSuccess = (AuthCredential credential) async {
      AuthResult result = await FirebaseAuth.instance.signInWithCredential(credential);
      FirebaseUser user = result.user;
      loginUser.userId = user.uid;
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Registration(this.loginUser),
        ),
      );
    };

    final PhoneVerificationFailed veriFailed = (AuthException exception) {
      if (exception.message.contains('not authorized'))
        status = 'Something has gone wrong, please try later';
      else if (exception.message.contains('Network'))
        status = 'Please check your internet connection and try again';
      else
        status = 'Something has gone wrong, please try later';
    };

    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNo,
      codeAutoRetrievalTimeout: autoRetrieve,
      codeSent: smsCodeSent,
      timeout: const Duration(seconds: 5),
      verificationCompleted: verifiedSuccess,
      verificationFailed: veriFailed,
    );
  }

  signUp(String smsCode, BuildContext context) async {
    try {
      FirebaseAuth auth = FirebaseAuth.instance;

      AuthCredential authCredential =
          PhoneAuthProvider.getCredential(verificationId: verificationId, smsCode: smsCode);
      AuthResult result = await auth.signInWithCredential(authCredential);
      FirebaseUser user = result.user;
      loginUser.userId = user.uid;
      FirebaseUser currentUser = await auth.currentUser();
      assert(user.uid == currentUser.uid);
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Registration(this.loginUser),
        ),
      );
    } catch (e) {
      handleError(e, context);
    }
  }

  signOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.pop(context);
    Navigator.pushReplacementNamed(context, '/welcomePage');
  }

  Future<FirebaseUser> checkSignIn() async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    return user;
  }

  signIn(BuildContext context, FirebaseUser user) {
    Navigator.pop(context);
    firestoreInstance.collection("users").document(user.uid).get().then((dataSnap) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(user.uid),
        ),
      );
    });
  }

  handleError(PlatformException error, BuildContext context) {
    switch (error.code) {
      case 'ERROR_INVALID_VERIFICATION_CODE':
        FocusScope.of(context).requestFocus(new FocusNode());
        status = 'Invalid Code';
        break;
      default:
        status = error.message;
        break;
    }
  }
}
