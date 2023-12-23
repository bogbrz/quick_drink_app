// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tables_page_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TablesPageState {
  String get errorMessage => throw _privateConstructorUsedError;
  Status get status => throw _privateConstructorUsedError;
  List<TableModel> get tables => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TablesPageStateCopyWith<TablesPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TablesPageStateCopyWith<$Res> {
  factory $TablesPageStateCopyWith(
          TablesPageState value, $Res Function(TablesPageState) then) =
      _$TablesPageStateCopyWithImpl<$Res, TablesPageState>;
  @useResult
  $Res call({String errorMessage, Status status, List<TableModel> tables});
}

/// @nodoc
class _$TablesPageStateCopyWithImpl<$Res, $Val extends TablesPageState>
    implements $TablesPageStateCopyWith<$Res> {
  _$TablesPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = null,
    Object? status = null,
    Object? tables = null,
  }) {
    return _then(_value.copyWith(
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      tables: null == tables
          ? _value.tables
          : tables // ignore: cast_nullable_to_non_nullable
              as List<TableModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TablesPageStateImplCopyWith<$Res>
    implements $TablesPageStateCopyWith<$Res> {
  factory _$$TablesPageStateImplCopyWith(_$TablesPageStateImpl value,
          $Res Function(_$TablesPageStateImpl) then) =
      __$$TablesPageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String errorMessage, Status status, List<TableModel> tables});
}

/// @nodoc
class __$$TablesPageStateImplCopyWithImpl<$Res>
    extends _$TablesPageStateCopyWithImpl<$Res, _$TablesPageStateImpl>
    implements _$$TablesPageStateImplCopyWith<$Res> {
  __$$TablesPageStateImplCopyWithImpl(
      _$TablesPageStateImpl _value, $Res Function(_$TablesPageStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = null,
    Object? status = null,
    Object? tables = null,
  }) {
    return _then(_$TablesPageStateImpl(
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      tables: null == tables
          ? _value._tables
          : tables // ignore: cast_nullable_to_non_nullable
              as List<TableModel>,
    ));
  }
}

/// @nodoc

class _$TablesPageStateImpl implements _TablesPageState {
  _$TablesPageStateImpl(
      {required this.errorMessage,
      required this.status,
      required final List<TableModel> tables})
      : _tables = tables;

  @override
  final String errorMessage;
  @override
  final Status status;
  final List<TableModel> _tables;
  @override
  List<TableModel> get tables {
    if (_tables is EqualUnmodifiableListView) return _tables;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tables);
  }

  @override
  String toString() {
    return 'TablesPageState(errorMessage: $errorMessage, status: $status, tables: $tables)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TablesPageStateImpl &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._tables, _tables));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorMessage, status,
      const DeepCollectionEquality().hash(_tables));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TablesPageStateImplCopyWith<_$TablesPageStateImpl> get copyWith =>
      __$$TablesPageStateImplCopyWithImpl<_$TablesPageStateImpl>(
          this, _$identity);
}

abstract class _TablesPageState implements TablesPageState {
  factory _TablesPageState(
      {required final String errorMessage,
      required final Status status,
      required final List<TableModel> tables}) = _$TablesPageStateImpl;

  @override
  String get errorMessage;
  @override
  Status get status;
  @override
  List<TableModel> get tables;
  @override
  @JsonKey(ignore: true)
  _$$TablesPageStateImplCopyWith<_$TablesPageStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
