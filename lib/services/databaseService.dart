import '../models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final firestoreInstance = Firestore.instance;

  createUser(User user) async {
    await firestoreInstance
        .collection('users')
        .document(user.mobileNumber)
        .setData({
      'phoneNumber': user.mobileNumber,
      'password': user.password,
      'name': user.name,
      'age': user.age,
      'lastPeriodDate': user.lastPeriodDate
    }, merge: true);
  }

  getUser(String phoneNumber) {
    return firestoreInstance
        .collection('users')
        .document(phoneNumber)
        .snapshots();
  }
}
