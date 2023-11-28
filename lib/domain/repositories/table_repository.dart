import 'package:quick_drink_app/table_remote_data_source.dart';

class TableRepository {
  TableRepository({required this.tableRemoteDataSource});
  final TableRemoteDataSource tableRemoteDataSource;
  Future<void> addTables(
      {required int tableNumber, required int guestsQuantity}) async {
    await tableRemoteDataSource.addTables(
        tableNumber: tableNumber, guestsQuantity: guestsQuantity);
  }
}
