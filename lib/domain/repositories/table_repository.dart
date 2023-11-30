
import 'package:quick_drink_app/data_source/table_remote_data_source.dart';
import 'package:quick_drink_app/domain/models/table_model.dart';

class TableRepository {
  TableRepository({required this.tableRemoteDataSource});
  final TableRemoteDataSource tableRemoteDataSource;

  Stream<List<TableModel>> getTablesData(
      ) {
    return tableRemoteDataSource.getTableData().map((querySnapshot) {
      return querySnapshot.docs.map((doc) {
        return TableModel(
            tableNumber: doc['tableNumber'],
            guestsQuantity: doc['guestsQuantity']);
      }).toList();
    });
  }

  Future<void> addTables(
      {required int tableNumber, required int guestsQuantity}) async {
    await tableRemoteDataSource.addTables(
        tableNumber: tableNumber, guestsQuantity: guestsQuantity);
  }
}
