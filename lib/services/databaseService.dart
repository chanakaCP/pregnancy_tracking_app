import 'dart:io';

import 'package:pregnancy_tracking_app/models/babyModel.dart';

import '../models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class DatabaseService {
  final firestoreInstance = Firestore.instance;
  final storageInstance = FirebaseStorage.instance;

  createUser(User user) async {
    await firestoreInstance.collection('users').document(user.userId).setData(
      {
        'userId': user.userId,
        'phoneNumber': user.mobileNumber,
        'name': user.name,
        'age': user.age,
        'profileImage': user.profileImageURL,
        'lastPeriodDate': user.lastPeriodDate,
        'dueDate': user.lastPeriodDate.add(Duration(days: 280)),
      },
      merge: true,
    );
  }

  Future uploadImage(String filePath, File file, User currentUser) async {
    // need to be delete prev: image
    StorageReference storageReference = storageInstance.ref();
    StorageUploadTask uploadTask = storageReference.child(filePath).putFile(file);

    StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
    taskSnapshot.ref.getDownloadURL().then((downloadURL) {
      currentUser.profileImageURL = downloadURL;
      createUser(currentUser);
    });
  }

  Stream<dynamic> getUser(String userId) {
    return firestoreInstance.collection('users').document(userId).snapshots();
  }

  insertBabyWeek(Baby baby) async {
    await firestoreInstance.collection('babyWeek').document("week" + baby.week.toString()).setData(
      {
        'week': baby.week,
        'size': baby.size,
        'weight': baby.weight,
        'imageURL': baby.imageURL,
        'tipDescription': baby.tipDescription,
      },
      merge: true,
    );
  }

  deleteBabyWeek(int week) {
    return firestoreInstance.collection("babyWeek").document("week" + week.toString()).delete();
  }
}
