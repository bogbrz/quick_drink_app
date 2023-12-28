import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@injectable
class TableRemoteDataSource {
  final UserId = FirebaseAuth.instance.currentUser?.uid;
  Stream<QuerySnapshot<Map<String, dynamic>>> getTableData() {
    if (UserId == null) {
      throw Exception("user not logged in");
    }
    return FirebaseFirestore.instance
        .collection("users")
        .doc(UserId)
        .collection('tables')
        .orderBy("tableNumber")
        .snapshots();
  }

  Future<void> addTables({
    required int tableNumber,
  }) async {
    if (UserId == null) {
      throw Exception("user not logged in");
    }
    FirebaseFirestore.instance
        .collection("users")
        .doc(UserId)
        .collection('tables')
        .add({
      "tableNumber": tableNumber,
    });
  }

  Future<void> removeTable({required String docId}) async {
    if (UserId == null) {
      throw Exception("user not logged in");
    }
    return FirebaseFirestore.instance
        .collection("users")
        .doc(UserId)
        .collection('tables')
        .doc(docId)
        .delete();
  }
}
