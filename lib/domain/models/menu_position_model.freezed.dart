// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'menu_position_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MenuPositionModel _$MenuPositionModelFromJson(Map<String, dynamic> json) {
  return _MenuPositionModel.fromJson(json);
}

/// @nodoc
mixin _$MenuPositionModel {
  String get name => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  String get ingredients => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MenuPositionModelCopyWith<MenuPositionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenuPositionModelCopyWith<$Res> {
  factory $MenuPositionModelCopyWith(
          MenuPositionModel value, $Res Function(MenuPositionModel) then) =
      _$MenuPositionModelCopyWithImpl<$Res, MenuPositionModel>;
  @useResult
  $Res call(
      {String name, String id, double price, String ingredients, String type});
}

/// @nodoc
class _$MenuPositionModelCopyWithImpl<$Res, $Val extends MenuPositionModel>
    implements $MenuPositionModelCopyWith<$Res> {
  _$MenuPositionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? id = null,
    Object? price = null,
    Object? ingredients = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      ingredients: null == ingredients
          ? _value.ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MenuPositionModelImplCopyWith<$Res>
    implements $MenuPositionModelCopyWith<$Res> {
  factory _$$MenuPositionModelImplCopyWith(_$MenuPositionModelImpl value,
          $Res Function(_$MenuPositionModelImpl) then) =
      __$$MenuPositionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name, String id, double price, String ingredients, String type});
}

/// @nodoc
class __$$MenuPositionModelImplCopyWithImpl<$Res>
    extends _$MenuPositionModelCopyWithImpl<$Res, _$MenuPositionModelImpl>
    implements _$$MenuPositionModelImplCopyWith<$Res> {
  __$$MenuPositionModelImplCopyWithImpl(_$MenuPositionModelImpl _value,
      $Res Function(_$MenuPositionModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? id = null,
    Object? price = null,
    Object? ingredients = null,
    Object? type = null,
  }) {
    return _then(_$MenuPositionModelImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      ingredients: null == ingredients
          ? _value.ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$MenuPositionModelImpl implements _MenuPositionModel {
  _$MenuPositionModelImpl(
      {required this.name,
      required this.id,
      required this.price,
      required this.ingredients,
      required this.type});

  factory _$MenuPositionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MenuPositionModelImplFromJson(json);

  @override
  final String name;
  @override
  final String id;
  @override
  final double price;
  @override
  final String ingredients;
  @override
  final String type;

  @override
  String toString() {
    return 'MenuPositionModel(name: $name, id: $id, price: $price, ingredients: $ingredients, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MenuPositionModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.ingredients, ingredients) ||
                other.ingredients == ingredients) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, id, price, ingredients, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MenuPositionModelImplCopyWith<_$MenuPositionModelImpl> get copyWith =>
      __$$MenuPositionModelImplCopyWithImpl<_$MenuPositionModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MenuPositionModelImplToJson(
      this,
    );
  }
}

abstract class _MenuPositionModel implements MenuPositionModel {
  factory _MenuPositionModel(
      {required final String name,
      required final String id,
      required final double price,
      required final String ingredients,
      required final String type}) = _$MenuPositionModelImpl;

  factory _MenuPositionModel.fromJson(Map<String, dynamic> json) =
      _$MenuPositionModelImpl.fromJson;

  @override
  String get name;
  @override
  String get id;
  @override
  double get price;
  @override
  String get ingredients;
  @override
  String get type;
  @override
  @JsonKey(ignore: true)
  _$$MenuPositionModelImplCopyWith<_$MenuPositionModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
