import '../models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final firestoreInstance = Firestore.instance;

  createUser(User user) async {
    await firestoreInstance.collection('users').document(user.userId).setData({
      'userId': user.userId,
      'phoneNumber': user.mobileNumber,
      'name': user.name,
      'age': user.age,
      'lastPeriodDate': user.lastPeriodDate
    }, merge: true);
  }

  getUser(String userId) {
    return firestoreInstance.collection('users').document(userId).snapshots();
  }
}
