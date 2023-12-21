import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quick_drink_app/domain/models/table_model.dart';
import 'package:quick_drink_app/domain/repositories/tables_repository.dart';

part 'tables_page_state.dart';
part 'tables_page_cubit.freezed.dart';


class TablesPageCubit extends Cubit<TablesPageState> {
  TablesPageCubit({required this.tableRepository})
      : super(TablesPageState(tables: [], errorMessage: ''));

  StreamSubscription? streamSubscription;
  final TableRepository tableRepository;

  Future<void> getTables() async {
    streamSubscription = tableRepository.getTablesData().listen(
      (tables) {
        emit(
          TablesPageState(
            errorMessage: '',
            tables: tables,
          ),
        );
      },
    )..onError(
        (error) {
          emit(
            TablesPageState(
              errorMessage: error,
              tables: [],
            ),
          );
        },
      );
  }

  Future<void> removeTable({required String docId}) async {
    tableRepository.removeTable(docId: docId);
  }

  Future<void> addTable({
    required tableNumber,
  }) async {
    tableRepository.addTables(
      tableNumber: tableNumber,
    );
  }

  @override
  Future<void> close() {
    streamSubscription?.cancel();
    return super.close();
  }
}
