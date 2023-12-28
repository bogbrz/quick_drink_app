// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_page_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OrderPageState {
  String get errorMessage => throw _privateConstructorUsedError;
  List<OrderModel> get orders => throw _privateConstructorUsedError;
  double get orderValue => throw _privateConstructorUsedError;
  Status get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OrderPageStateCopyWith<OrderPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderPageStateCopyWith<$Res> {
  factory $OrderPageStateCopyWith(
          OrderPageState value, $Res Function(OrderPageState) then) =
      _$OrderPageStateCopyWithImpl<$Res, OrderPageState>;
  @useResult
  $Res call(
      {String errorMessage,
      List<OrderModel> orders,
      double orderValue,
      Status status});
}

/// @nodoc
class _$OrderPageStateCopyWithImpl<$Res, $Val extends OrderPageState>
    implements $OrderPageStateCopyWith<$Res> {
  _$OrderPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = null,
    Object? orders = null,
    Object? orderValue = null,
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
              as List<OrderModel>,
      orderValue: null == orderValue
          ? _value.orderValue
          : orderValue // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderPageStateImplCopyWith<$Res>
    implements $OrderPageStateCopyWith<$Res> {
  factory _$$OrderPageStateImplCopyWith(_$OrderPageStateImpl value,
          $Res Function(_$OrderPageStateImpl) then) =
      __$$OrderPageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String errorMessage,
      List<OrderModel> orders,
      double orderValue,
      Status status});
}

/// @nodoc
class __$$OrderPageStateImplCopyWithImpl<$Res>
    extends _$OrderPageStateCopyWithImpl<$Res, _$OrderPageStateImpl>
    implements _$$OrderPageStateImplCopyWith<$Res> {
  __$$OrderPageStateImplCopyWithImpl(
      _$OrderPageStateImpl _value, $Res Function(_$OrderPageStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = null,
    Object? orders = null,
    Object? orderValue = null,
    Object? status = null,
  }) {
    return _then(_$OrderPageStateImpl(
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      orders: null == orders
          ? _value._orders
          : orders // ignore: cast_nullable_to_non_nullable
              as List<OrderModel>,
      orderValue: null == orderValue
          ? _value.orderValue
          : orderValue // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
    ));
  }
}

/// @nodoc

class _$OrderPageStateImpl implements _OrderPageState {
  _$OrderPageStateImpl(
      {required this.errorMessage,
      required final List<OrderModel> orders,
      required this.orderValue,
      required this.status})
      : _orders = orders;

  @override
  final String errorMessage;
  final List<OrderModel> _orders;
  @override
  List<OrderModel> get orders {
    if (_orders is EqualUnmodifiableListView) return _orders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orders);
  }

  @override
  final double orderValue;
  @override
  final Status status;

  @override
  String toString() {
    return 'OrderPageState(errorMessage: $errorMessage, orders: $orders, orderValue: $orderValue, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderPageStateImpl &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            const DeepCollectionEquality().equals(other._orders, _orders) &&
            (identical(other.orderValue, orderValue) ||
                other.orderValue == orderValue) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorMessage,
      const DeepCollectionEquality().hash(_orders), orderValue, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderPageStateImplCopyWith<_$OrderPageStateImpl> get copyWith =>
      __$$OrderPageStateImplCopyWithImpl<_$OrderPageStateImpl>(
          this, _$identity);
}

abstract class _OrderPageState implements OrderPageState {
  factory _OrderPageState(
      {required final String errorMessage,
      required final List<OrderModel> orders,
      required final double orderValue,
      required final Status status}) = _$OrderPageStateImpl;

  @override
  String get errorMessage;
  @override
  List<OrderModel> get orders;
  @override
  double get orderValue;
  @override
  Status get status;
  @override
  @JsonKey(ignore: true)
  _$$OrderPageStateImplCopyWith<_$OrderPageStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
