import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:quick_drink_app/domain/repositories/table_repository.dart';

part 'tables_page_state.dart';

class TablesPageCubit extends Cubit<TablesPageState> {
  TablesPageCubit({required this.tableRepository}) : super(TablesPageState());

  final TableRepository tableRepository;

  Future<void> addTable({required tableNumber, guestsQuantity}) async {
    tableRepository.addTables(
        tableNumber: tableNumber, guestsQuantity: guestsQuantity);
  }
}
