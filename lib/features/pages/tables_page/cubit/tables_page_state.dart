part of 'tables_page_cubit.dart';

@freezed
class TablesPageState with _$TablesPageState {


  factory TablesPageState(
      {required String errorMessage,
      required List<TableModel> tables}) = _TablesPageState;
}
