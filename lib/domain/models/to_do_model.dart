

import 'package:freezed_annotation/freezed_annotation.dart';
part 'to_do_model.freezed.dart';
@freezed
class ToDoModel with _$ToDoModel {
  factory ToDoModel({
    required String name,
    required int quantity,
  
    required int  tableNumber,
    required String type,
    required String  id,
  }) = _ToDoModel;

 


}
