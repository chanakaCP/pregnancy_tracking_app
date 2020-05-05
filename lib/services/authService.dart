import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import '../Screens/regitration.dart';
import '../models/user.dart';

class AuthService {
  String phoneNo;
  String verificationId;
  String status;
  User loginUser;

  Future<void> verifyPhone(
      String mobileNumber, User loginUser, BuildContext context) async {
    phoneNo = mobileNumber;
    this.loginUser = loginUser;
    final PhoneCodeAutoRetrievalTimeout autoRetrieve = (String verId) {
      verificationId = verId;
    };

    final PhoneCodeSent smsCodeSent = (String verId, [int forceCodeResend]) {
      print("code send");
      verificationId = verId;
    };

    final PhoneVerificationCompleted verifiedSuccess =
        (AuthCredential credential) async {
      AuthResult result =
          await FirebaseAuth.instance.signInWithCredential(credential);
      FirebaseUser user = result.user;
      this.loginUser.uId = user.uid;
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Registration(user.uid, this.loginUser),
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

  signIn(String smsCode, BuildContext context) async {
    try {
      FirebaseAuth auth = FirebaseAuth.instance;

      AuthCredential authCredential = PhoneAuthProvider.getCredential(
          verificationId: verificationId, smsCode: smsCode);
      AuthResult result = await auth.signInWithCredential(authCredential);
      FirebaseUser user = result.user;
      FirebaseUser currentUser = await auth.currentUser();
      assert(user.uid == currentUser.uid);
      this.loginUser.uId = user.uid;
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Registration(user.uid, this.loginUser),
        ),
      );
    } catch (e) {
      handleError(e, context);
    }
  }

  handleError(PlatformException error, BuildContext context) {
    switch (error.code) {
      case 'ERROR_INVALID_VERIFICATION_CODE':
        FocusScope.of(context).requestFocus(new FocusNode());
        status = 'Invalid Code';
        print(status);
        break;
      default:
        status = error.message;
        break;
    }
  }
}
