import 'package:freezed_annotation/freezed_annotation.dart';
part 'table_model.freezed.dart';

@freezed
class TableModel with _$TableModel {
  factory TableModel({required int tableNumber, required String id}) =
      _TableModel;
}
