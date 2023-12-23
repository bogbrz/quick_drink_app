import 'package:freezed_annotation/freezed_annotation.dart';


part 'menu_position_model.g.dart';
part 'menu_position_model.freezed.dart';

@freezed
class MenuPositionModel with _$MenuPositionModel {
  factory MenuPositionModel({
   required String name,
   required String id,
   required double price,
   required String ingredients,
   required String type,
  }) = _MenuPositionModel;
    factory MenuPositionModel.fromJson(Map<String, dynamic> json) =>
      _$MenuPositionModelFromJson(json);
}

