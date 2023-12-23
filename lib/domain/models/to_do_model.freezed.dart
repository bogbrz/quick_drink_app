// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'to_do_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ToDoModel {
  String get name => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  int get tableNumber => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ToDoModelCopyWith<ToDoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ToDoModelCopyWith<$Res> {
  factory $ToDoModelCopyWith(ToDoModel value, $Res Function(ToDoModel) then) =
      _$ToDoModelCopyWithImpl<$Res, ToDoModel>;
  @useResult
  $Res call(
      {String name, int quantity, int tableNumber, String type, String id});
}

/// @nodoc
class _$ToDoModelCopyWithImpl<$Res, $Val extends ToDoModel>
    implements $ToDoModelCopyWith<$Res> {
  _$ToDoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? quantity = null,
    Object? tableNumber = null,
    Object? type = null,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      tableNumber: null == tableNumber
          ? _value.tableNumber
          : tableNumber // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ToDoModelImplCopyWith<$Res>
    implements $ToDoModelCopyWith<$Res> {
  factory _$$ToDoModelImplCopyWith(
          _$ToDoModelImpl value, $Res Function(_$ToDoModelImpl) then) =
      __$$ToDoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name, int quantity, int tableNumber, String type, String id});
}

/// @nodoc
class __$$ToDoModelImplCopyWithImpl<$Res>
    extends _$ToDoModelCopyWithImpl<$Res, _$ToDoModelImpl>
    implements _$$ToDoModelImplCopyWith<$Res> {
  __$$ToDoModelImplCopyWithImpl(
      _$ToDoModelImpl _value, $Res Function(_$ToDoModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? quantity = null,
    Object? tableNumber = null,
    Object? type = null,
    Object? id = null,
  }) {
    return _then(_$ToDoModelImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      tableNumber: null == tableNumber
          ? _value.tableNumber
          : tableNumber // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ToDoModelImpl implements _ToDoModel {
  _$ToDoModelImpl(
      {required this.name,
      required this.quantity,
      required this.tableNumber,
      required this.type,
      required this.id});

  @override
  final String name;
  @override
  final int quantity;
  @override
  final int tableNumber;
  @override
  final String type;
  @override
  final String id;

  @override
  String toString() {
    return 'ToDoModel(name: $name, quantity: $quantity, tableNumber: $tableNumber, type: $type, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ToDoModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.tableNumber, tableNumber) ||
                other.tableNumber == tableNumber) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, name, quantity, tableNumber, type, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ToDoModelImplCopyWith<_$ToDoModelImpl> get copyWith =>
      __$$ToDoModelImplCopyWithImpl<_$ToDoModelImpl>(this, _$identity);
}

abstract class _ToDoModel implements ToDoModel {
  factory _ToDoModel(
      {required final String name,
      required final int quantity,
      required final int tableNumber,
      required final String type,
      required final String id}) = _$ToDoModelImpl;

  @override
  String get name;
  @override
  int get quantity;
  @override
  int get tableNumber;
  @override
  String get type;
  @override
  String get id;
  @override
  @JsonKey(ignore: true)
  _$$ToDoModelImplCopyWith<_$ToDoModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
