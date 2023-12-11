import 'package:cloud_firestore/cloud_firestore.dart';

class PreOrderRemoteDataSource {
  Stream<QuerySnapshot<Map<String, dynamic>>> getPreOrderData() {
    return FirebaseFirestore.instance.collection("PreOrder").snapshots();
  }

 
 
}
