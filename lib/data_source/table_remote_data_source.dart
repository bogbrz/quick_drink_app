import 'package:cloud_firestore/cloud_firestore.dart';

class TableRemoteDataSource {
  Stream<QuerySnapshot<Map<String, dynamic>>> getTableData() {
    return FirebaseFirestore.instance
        .collection('tables')
        .orderBy("tableNumber")
        .snapshots();
  }

  Future<void> addTables({
    required int tableNumber,
  }) async {
    FirebaseFirestore.instance.collection('tables')
      .add({
        "tableNumber": tableNumber,
      });
  }

  Future<void> removeTable({required String docId}) async {
    return FirebaseFirestore.instance.collection('tables').doc(docId).delete();
  }
}
