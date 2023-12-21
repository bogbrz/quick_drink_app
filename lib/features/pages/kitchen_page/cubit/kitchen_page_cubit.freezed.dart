// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kitchen_page_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$KitchenPageState {
  String get errorMessage => throw _privateConstructorUsedError;
  List<ToDoModel> get orders => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $KitchenPageStateCopyWith<KitchenPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KitchenPageStateCopyWith<$Res> {
  factory $KitchenPageStateCopyWith(
          KitchenPageState value, $Res Function(KitchenPageState) then) =
      _$KitchenPageStateCopyWithImpl<$Res, KitchenPageState>;
  @useResult
  $Res call({String errorMessage, List<ToDoModel> orders});
}

/// @nodoc
class _$KitchenPageStateCopyWithImpl<$Res, $Val extends KitchenPageState>
    implements $KitchenPageStateCopyWith<$Res> {
  _$KitchenPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = null,
    Object? orders = null,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$KitchenPageStateImplCopyWith<$Res>
    implements $KitchenPageStateCopyWith<$Res> {
  factory _$$KitchenPageStateImplCopyWith(_$KitchenPageStateImpl value,
          $Res Function(_$KitchenPageStateImpl) then) =
      __$$KitchenPageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String errorMessage, List<ToDoModel> orders});
}

/// @nodoc
class __$$KitchenPageStateImplCopyWithImpl<$Res>
    extends _$KitchenPageStateCopyWithImpl<$Res, _$KitchenPageStateImpl>
    implements _$$KitchenPageStateImplCopyWith<$Res> {
  __$$KitchenPageStateImplCopyWithImpl(_$KitchenPageStateImpl _value,
      $Res Function(_$KitchenPageStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = null,
    Object? orders = null,
  }) {
    return _then(_$KitchenPageStateImpl(
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      orders: null == orders
          ? _value._orders
          : orders // ignore: cast_nullable_to_non_nullable
              as List<ToDoModel>,
    ));
  }
}

/// @nodoc

class _$KitchenPageStateImpl implements _KitchenPageState {
  _$KitchenPageStateImpl(
      {required this.errorMessage, required final List<ToDoModel> orders})
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
  String toString() {
    return 'KitchenPageState(errorMessage: $errorMessage, orders: $orders)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KitchenPageStateImpl &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            const DeepCollectionEquality().equals(other._orders, _orders));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, errorMessage, const DeepCollectionEquality().hash(_orders));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$KitchenPageStateImplCopyWith<_$KitchenPageStateImpl> get copyWith =>
      __$$KitchenPageStateImplCopyWithImpl<_$KitchenPageStateImpl>(
          this, _$identity);
}

abstract class _KitchenPageState implements KitchenPageState {
  factory _KitchenPageState(
      {required final String errorMessage,
      required final List<ToDoModel> orders}) = _$KitchenPageStateImpl;

  @override
  String get errorMessage;
  @override
  List<ToDoModel> get orders;
  @override
  @JsonKey(ignore: true)
  _$$KitchenPageStateImplCopyWith<_$KitchenPageStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
