import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:street_workout/firebase/user_model.dart';

class UserRegistration extends ChangeNotifier {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final String _collectionName = "usersData";
  late int length;
  Future<bool> checkIfUserAlreadyPresent({required String? userId}) async {
    try {
      final DocumentSnapshot findResults = await _firebaseFirestore
          .collection(_collectionName)
          .doc(userId)
          .get();
      return findResults.exists ? true : false;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  Future<void> registerNewUser({required UserModel tmpUser}) async {
    try {
      final String currentDate =
          DateFormat('dd-MM-yyyy').format(DateTime.now());
      final String currentTime = DateFormat('hh:mm:a').format(DateTime.now());
      await _firebaseFirestore.collection("data").doc("userCount").get().then(
        (value) {
          length = value["userCountNumber"] as int;
          length = length + 1;
          debugPrint(length.toString());
        },
      );
      await _firebaseFirestore.collection("data").doc("userCount").update(
        {
          "userCountNumber": length,
        },
      );
      await _firebaseFirestore
          .doc('$_collectionName/${FirebaseAuth.instance.currentUser?.uid}')
          .set(
        {
          "name": tmpUser.name,
          "surname": tmpUser.surname,
          "email": tmpUser.email,
          "profileImage": tmpUser.image,
          "bio": tmpUser.bio,
          "parcs": tmpUser.parcs,
          "dateCreation": currentDate,
          "timeCreation": currentTime,
          "images": [],
          "rewards": [],
          "numberFollowers": 0,
          "numberParcs": 0,
          "numberFollowing": 0,
          "rank": length,
        },
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
