import 'package:flutter/cupertino.dart';

import '../models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final firestoreInstance = Firestore.instance;
  Map<dynamic, dynamic> currnetUser;

  createUser(User user) async {
    await firestoreInstance.collection('users').document(user.userId).setData(
      {
        'userId': user.userId,
        'phoneNumber': user.mobileNumber,
        'name': user.name,
        'age': user.age,
        'lastPeriodDate': user.lastPeriodDate,
        'dueDate': user.lastPeriodDate.add(Duration(days: 280)),
      },
      merge: true,
    );
  }

  Stream<dynamic> getUser(String userId) {
    return firestoreInstance.collection('users').document(userId).snapshots();
  }
}
