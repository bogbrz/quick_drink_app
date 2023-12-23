// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'table_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TableModel {
  int get tableNumber => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TableModelCopyWith<TableModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TableModelCopyWith<$Res> {
  factory $TableModelCopyWith(
          TableModel value, $Res Function(TableModel) then) =
      _$TableModelCopyWithImpl<$Res, TableModel>;
  @useResult
  $Res call({int tableNumber, String id});
}

/// @nodoc
class _$TableModelCopyWithImpl<$Res, $Val extends TableModel>
    implements $TableModelCopyWith<$Res> {
  _$TableModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tableNumber = null,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      tableNumber: null == tableNumber
          ? _value.tableNumber
          : tableNumber // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TableModelImplCopyWith<$Res>
    implements $TableModelCopyWith<$Res> {
  factory _$$TableModelImplCopyWith(
          _$TableModelImpl value, $Res Function(_$TableModelImpl) then) =
      __$$TableModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int tableNumber, String id});
}

/// @nodoc
class __$$TableModelImplCopyWithImpl<$Res>
    extends _$TableModelCopyWithImpl<$Res, _$TableModelImpl>
    implements _$$TableModelImplCopyWith<$Res> {
  __$$TableModelImplCopyWithImpl(
      _$TableModelImpl _value, $Res Function(_$TableModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tableNumber = null,
    Object? id = null,
  }) {
    return _then(_$TableModelImpl(
      tableNumber: null == tableNumber
          ? _value.tableNumber
          : tableNumber // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$TableModelImpl implements _TableModel {
  _$TableModelImpl({required this.tableNumber, required this.id});

  @override
  final int tableNumber;
  @override
  final String id;

  @override
  String toString() {
    return 'TableModel(tableNumber: $tableNumber, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TableModelImpl &&
            (identical(other.tableNumber, tableNumber) ||
                other.tableNumber == tableNumber) &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, tableNumber, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TableModelImplCopyWith<_$TableModelImpl> get copyWith =>
      __$$TableModelImplCopyWithImpl<_$TableModelImpl>(this, _$identity);
}

abstract class _TableModel implements TableModel {
  factory _TableModel(
      {required final int tableNumber,
      required final String id}) = _$TableModelImpl;

  @override
  int get tableNumber;
  @override
  String get id;
  @override
  @JsonKey(ignore: true)
  _$$TableModelImplCopyWith<_$TableModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
