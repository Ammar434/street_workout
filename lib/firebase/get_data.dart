import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:street_workout/data/current_user.dart';

class GetData {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>>
      getParcsData() async {
    var value = await _firebaseFirestore.collection('allParcsData').get();
    return (value.docs);
  }

  Future<String> getCurrentUserProfileImage() async {
    final value = await FirebaseStorage.instance
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
}
