import 'package:cloud_firestore/cloud_firestore.dart';

class UserDatabaseService {
  final firestoreInstance = Firestore.instance;
  // Map<dynamic, dynamic> currnetUser;

  Stream<dynamic> getBabyWeek(int week) {
    return firestoreInstance.collection("babyWeek").document("week" + week.toString()).snapshots();
  }

  Stream<dynamic> getMomWeek(int week) {
    return firestoreInstance
        .collection("momsInWeek")
        .document("week" + week.toString())
        .snapshots();
  }

  Stream<dynamic> getMomMonth(int month) {
    return firestoreInstance
        .collection("momsInMonth")
        .document("month" + month.toString())
        .snapshots();
  }
}
