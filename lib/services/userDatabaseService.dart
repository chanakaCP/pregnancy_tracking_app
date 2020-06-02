import 'package:cloud_firestore/cloud_firestore.dart';

class UserDatabaseService {
  final firestoreInstance = Firestore.instance;
  // Map<dynamic, dynamic> currnetUser;

  Stream<dynamic> getBabyWeek(int week) {
    return firestoreInstance.collection("babyWeek").document("week" + week.toString()).snapshots();
  }
}
