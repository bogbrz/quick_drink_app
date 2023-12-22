// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bar_page_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BarPageState {
  String get errorMessage => throw _privateConstructorUsedError;
  List<ToDoModel> get orders => throw _privateConstructorUsedError;
  Status get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BarPageStateCopyWith<BarPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BarPageStateCopyWith<$Res> {
  factory $BarPageStateCopyWith(
          BarPageState value, $Res Function(BarPageState) then) =
      _$BarPageStateCopyWithImpl<$Res, BarPageState>;
  @useResult
  $Res call({String errorMessage, List<ToDoModel> orders, Status status});
}

/// @nodoc
class _$BarPageStateCopyWithImpl<$Res, $Val extends BarPageState>
    implements $BarPageStateCopyWith<$Res> {
  _$BarPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = null,
    Object? orders = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      orders: null == orders
          ? _value.orders
          : orders // ignore: cast_nullable_to_non_nullable
              as List<ToDoModel>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BarPageStateImplCopyWith<$Res>
    implements $BarPageStateCopyWith<$Res> {
  factory _$$BarPageStateImplCopyWith(
          _$BarPageStateImpl value, $Res Function(_$BarPageStateImpl) then) =
      __$$BarPageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String errorMessage, List<ToDoModel> orders, Status status});
}

/// @nodoc
class __$$BarPageStateImplCopyWithImpl<$Res>
    extends _$BarPageStateCopyWithImpl<$Res, _$BarPageStateImpl>
    implements _$$BarPageStateImplCopyWith<$Res> {
  __$$BarPageStateImplCopyWithImpl(
      _$BarPageStateImpl _value, $Res Function(_$BarPageStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = null,
    Object? orders = null,
    Object? status = null,
  }) {
    return _then(_$BarPageStateImpl(
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      orders: null == orders
          ? _value._orders
          : orders // ignore: cast_nullable_to_non_nullable
              as List<ToDoModel>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
    ));
  }
}

/// @nodoc

class _$BarPageStateImpl implements _BarPageState {
  _$BarPageStateImpl(
      {required this.errorMessage,
      required final List<ToDoModel> orders,
      required this.status})
      : _orders = orders;

  @override
  final String errorMessage;
  final List<ToDoModel> _orders;
  @override
  List<ToDoModel> get orders {
    if (_orders is EqualUnmodifiableListView) return _orders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orders);
  }

  @override
  final Status status;

  @override
  String toString() {
    return 'BarPageState(errorMessage: $errorMessage, orders: $orders, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BarPageStateImpl &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            const DeepCollectionEquality().equals(other._orders, _orders) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorMessage,
      const DeepCollectionEquality().hash(_orders), status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BarPageStateImplCopyWith<_$BarPageStateImpl> get copyWith =>
      __$$BarPageStateImplCopyWithImpl<_$BarPageStateImpl>(this, _$identity);
}

abstract class _BarPageState implements BarPageState {
  factory _BarPageState(
      {required final String errorMessage,
      required final List<ToDoModel> orders,
      required final Status status}) = _$BarPageStateImpl;

  @override
  String get errorMessage;
  @override
  List<ToDoModel> get orders;
  @override
  Status get status;
  @override
  @JsonKey(ignore: true)
  _$$BarPageStateImplCopyWith<_$BarPageStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
