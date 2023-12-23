// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_page_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AddPageState {
  String get errorMessage => throw _privateConstructorUsedError;
  Status get status => throw _privateConstructorUsedError;
  List<MenuPositionModel> get postitions => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddPageStateCopyWith<AddPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddPageStateCopyWith<$Res> {
  factory $AddPageStateCopyWith(
          AddPageState value, $Res Function(AddPageState) then) =
      _$AddPageStateCopyWithImpl<$Res, AddPageState>;
  @useResult
  $Res call(
      {String errorMessage, Status status, List<MenuPositionModel> postitions});
}

/// @nodoc
class _$AddPageStateCopyWithImpl<$Res, $Val extends AddPageState>
    implements $AddPageStateCopyWith<$Res> {
  _$AddPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = null,
    Object? status = null,
    Object? postitions = null,
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
      postitions: null == postitions
          ? _value.postitions
          : postitions // ignore: cast_nullable_to_non_nullable
              as List<MenuPositionModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddPageStateImplCopyWith<$Res>
    implements $AddPageStateCopyWith<$Res> {
  factory _$$AddPageStateImplCopyWith(
          _$AddPageStateImpl value, $Res Function(_$AddPageStateImpl) then) =
      __$$AddPageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String errorMessage, Status status, List<MenuPositionModel> postitions});
}

/// @nodoc
class __$$AddPageStateImplCopyWithImpl<$Res>
    extends _$AddPageStateCopyWithImpl<$Res, _$AddPageStateImpl>
    implements _$$AddPageStateImplCopyWith<$Res> {
  __$$AddPageStateImplCopyWithImpl(
      _$AddPageStateImpl _value, $Res Function(_$AddPageStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = null,
    Object? status = null,
    Object? postitions = null,
  }) {
    return _then(_$AddPageStateImpl(
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      postitions: null == postitions
          ? _value._postitions
          : postitions // ignore: cast_nullable_to_non_nullable
              as List<MenuPositionModel>,
    ));
  }
}

/// @nodoc

class _$AddPageStateImpl implements _AddPageState {
  _$AddPageStateImpl(
      {required this.errorMessage,
      required this.status,
      required final List<MenuPositionModel> postitions})
      : _postitions = postitions;

  @override
  final String errorMessage;
  @override
  final Status status;
  final List<MenuPositionModel> _postitions;
  @override
  List<MenuPositionModel> get postitions {
    if (_postitions is EqualUnmodifiableListView) return _postitions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_postitions);
  }

  @override
  String toString() {
    return 'AddPageState(errorMessage: $errorMessage, status: $status, postitions: $postitions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddPageStateImpl &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._postitions, _postitions));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorMessage, status,
      const DeepCollectionEquality().hash(_postitions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddPageStateImplCopyWith<_$AddPageStateImpl> get copyWith =>
      __$$AddPageStateImplCopyWithImpl<_$AddPageStateImpl>(this, _$identity);
}

abstract class _AddPageState implements AddPageState {
  factory _AddPageState(
      {required final String errorMessage,
      required final Status status,
      required final List<MenuPositionModel> postitions}) = _$AddPageStateImpl;

  @override
  String get errorMessage;
  @override
  Status get status;
  @override
  List<MenuPositionModel> get postitions;
  @override
  @JsonKey(ignore: true)
  _$$AddPageStateImplCopyWith<_$AddPageStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
