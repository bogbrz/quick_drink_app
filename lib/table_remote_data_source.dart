import 'package:cloud_firestore/cloud_firestore.dart';

class TableRemoteDataSource {
  Future<void> addTables(
      {required int tableNumber, required int guestsQuantity}) async {
    FirebaseFirestore.instance
        .collection('tables')
        .add({"tableNumber": tableNumber, "guestsQuantity": guestsQuantity});
  }
}
