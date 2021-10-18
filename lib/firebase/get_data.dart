import 'package:cloud_firestore/cloud_firestore.dart';

class GetData {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>>
      getParcsData() async {
    var value = await _firebaseFirestore.collection('allParcsData').get();
    return (value.docs);
  }

  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>>
      getUsersData() async {
    var value = await _firebaseFirestore.collection('usersData').get();
    return (value.docs);
  }

  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>>
      getLeaderboardData() async {
    var value = await _firebaseFirestore
        .collection('generation_users')
        .orderBy('rank', descending: false)
        .get();
    return (value.docs);
  }
}
