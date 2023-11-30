import 'package:cloud_firestore/cloud_firestore.dart';

class TableRemoteDataSource {
  Stream<QuerySnapshot<Map<String, dynamic>>> getTableData() {
    return FirebaseFirestore.instance.collection('tables').snapshots();
  }

  Future<void> addTables(
      {required int tableNumber, required int guestsQuantity}) async {
    FirebaseFirestore.instance
        .collection('tables')
        .add({"tableNumber": tableNumber, "guestsQuantity": guestsQuantity});
  }
}
