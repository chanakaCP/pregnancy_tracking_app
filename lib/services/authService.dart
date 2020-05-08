import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import '../Screens/regitration.dart';
import '../Screens/home.dart';
import '../models/user.dart';
import '../shared/shared.dart';

class AuthService {
  String phoneNo;
  String verificationId;
  String status;
  User loginUser;
  Shared shared = Shared();
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

    final PhoneVerificationCompleted verifiedSuccess =
        (AuthCredential credential) async {
      AuthResult result =
          await FirebaseAuth.instance.signInWithCredential(credential);
      FirebaseUser user = result.user;
      loginUser.userId = user.uid;
      print("uid when created" + loginUser.userId);
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

      AuthCredential authCredential = PhoneAuthProvider.getCredential(
          verificationId: verificationId, smsCode: smsCode);
      AuthResult result = await auth.signInWithCredential(authCredential);
      FirebaseUser user = result.user;
      loginUser.userId = user.uid;
      print("uid when created " + loginUser.userId);
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

  // signIn(String phoneNumber, String password, BuildContext context) async {
  //   phoneNumber = shared.setMobileNumber(phoneNumber);
  //   print(phoneNumber);
  //   print(phoneNumber);
  //   print(password);
  //   await firestoreInstance
  //       .collection('users')
  //       .document(phoneNumber)
  //       .get()
  //       .then(
  //     (doc) {
  //       if (doc.exists) {
  //         print('doc exist');
  //         firestoreInstance
  //             .collection('users')
  //             .document(phoneNumber)
  //             .get()
  //             .then(
  //           (doc) {
  //             if (doc.data['password'] == password) {
  //               print('correct user');
  //               Navigator.pop(context);
  //               Navigator.push(
  //                 context,
  //                 MaterialPageRoute(
  //                   builder: (context) => Home(phoneNumber),
  //                 ),
  //               );
  //             } else {
  //               print("invalid password");
  //             }
  //           },
  //         );
  //       } else {
  //         print("invalid username");
  //         // invalid username
  //         return null;
  //       }
  //     },
  //   );
  // }
}
