import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:street_workout/data/current_user.dart';

class GetData {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>>
      getParcsData() async {
    var value = await _firebaseFirestore.collection('allParcsData').get();
    return (value.docs);
  }

  Future<String> getCurrentUserProfileImage() async {
    final value = await _firebaseStorage
        .ref()
        .child('${FirebaseAuth.instance.currentUser?.uid}/profileImage')
        .getDownloadURL();
    currentUserImage = value;
    return (value);
  }

  Future<String> getCurrentUserName() async {
    var value = await _firebaseFirestore
        .collection('usersData')
        .doc('${FirebaseAuth.instance.currentUser?.uid}')
        .get();
    currentUserName = value['name'];
    return (value['name']);
  }

  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>>
      getUsersData() async {
    var value = await _firebaseFirestore.collection('usersData').get();
    return (value.docs);
  }

  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>>
      getLeaderboardData() async {
    var value = await _firebaseFirestore
        .collection('usersData')
        .orderBy('rank', descending: false)
        .get();
    return (value.docs);
  }

  Future<String?> deleteUserDataFromStorage() async {
    try {
      await _firebaseStorage
          .ref()
          .child('${FirebaseAuth.instance.currentUser?.uid}')
          .delete();
    } catch (e) {
      debugPrint("Can't not delete user data from storage");
    }
  }

  Future<String?> deleteUserDataFromDataBase() async {
    try {
      await _firebaseFirestore
          .collection('usersData')
          .doc('${FirebaseAuth.instance.currentUser?.uid}')
          .delete();
    } catch (e) {
      debugPrint("Can't not delete user data from database");
    }
  }
}
