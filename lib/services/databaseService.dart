import 'package:flutter/material.dart';
import '../models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final firestoreInstance = Firestore.instance;

  createUser(User user) async {
    await firestoreInstance.collection('users').document(user.uId).setData({
      'userId': user.uId,
      'phoneNumber': user.mobileNumber,
      'password': user.password,
      'name': user.name,
      'age': user.age,
      'lastPeriodDate': user.lastPeriodDate
    }, merge: true).then((_) => {print('success')});
  }
}
