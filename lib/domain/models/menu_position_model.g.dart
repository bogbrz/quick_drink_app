// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_position_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MenuPositionModelImpl _$$MenuPositionModelImplFromJson(
        Map<String, dynamic> json) =>
    _$MenuPositionModelImpl(
      name: json['name'] as String,
      id: json['id'] as String,
      price: (json['price'] as num).toDouble(),
      ingredients: json['ingredients'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$$MenuPositionModelImplToJson(
        _$MenuPositionModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'price': instance.price,
      'ingredients': instance.ingredients,
      'type': instance.type,
    };
