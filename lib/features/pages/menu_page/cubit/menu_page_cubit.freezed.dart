// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'menu_page_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MenuPageState {
  String get errorMessage => throw _privateConstructorUsedError;
  List<MenuPositionModel> get menuList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MenuPageStateCopyWith<MenuPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenuPageStateCopyWith<$Res> {
  factory $MenuPageStateCopyWith(
          MenuPageState value, $Res Function(MenuPageState) then) =
      _$MenuPageStateCopyWithImpl<$Res, MenuPageState>;
  @useResult
  $Res call({String errorMessage, List<MenuPositionModel> menuList});
}

/// @nodoc
class _$MenuPageStateCopyWithImpl<$Res, $Val extends MenuPageState>
    implements $MenuPageStateCopyWith<$Res> {
  _$MenuPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = null,
    Object? menuList = null,
  }) {
    return _then(_value.copyWith(
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      menuList: null == menuList
          ? _value.menuList
          : menuList // ignore: cast_nullable_to_non_nullable
              as List<MenuPositionModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MenuPageStateImplCopyWith<$Res>
    implements $MenuPageStateCopyWith<$Res> {
  factory _$$MenuPageStateImplCopyWith(
          _$MenuPageStateImpl value, $Res Function(_$MenuPageStateImpl) then) =
      __$$MenuPageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String errorMessage, List<MenuPositionModel> menuList});
}

/// @nodoc
class __$$MenuPageStateImplCopyWithImpl<$Res>
    extends _$MenuPageStateCopyWithImpl<$Res, _$MenuPageStateImpl>
    implements _$$MenuPageStateImplCopyWith<$Res> {
  __$$MenuPageStateImplCopyWithImpl(
      _$MenuPageStateImpl _value, $Res Function(_$MenuPageStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = null,
    Object? menuList = null,
  }) {
    return _then(_$MenuPageStateImpl(
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      menuList: null == menuList
          ? _value._menuList
          : menuList // ignore: cast_nullable_to_non_nullable
              as List<MenuPositionModel>,
    ));
  }
}

/// @nodoc

class _$MenuPageStateImpl implements _MenuPageState {
  _$MenuPageStateImpl(
      {required this.errorMessage,
      required final List<MenuPositionModel> menuList})
      : _menuList = menuList;

  @override
  final String errorMessage;
  final List<MenuPositionModel> _menuList;
  @override
  List<MenuPositionModel> get menuList {
    if (_menuList is EqualUnmodifiableListView) return _menuList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_menuList);
  }

  @override
  String toString() {
    return 'MenuPageState(errorMessage: $errorMessage, menuList: $menuList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MenuPageStateImpl &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            const DeepCollectionEquality().equals(other._menuList, _menuList));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorMessage,
      const DeepCollectionEquality().hash(_menuList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MenuPageStateImplCopyWith<_$MenuPageStateImpl> get copyWith =>
      __$$MenuPageStateImplCopyWithImpl<_$MenuPageStateImpl>(this, _$identity);
}

abstract class _MenuPageState implements MenuPageState {
  factory _MenuPageState(
      {required final String errorMessage,
      required final List<MenuPositionModel> menuList}) = _$MenuPageStateImpl;

  @override
  String get errorMessage;
  @override
  List<MenuPositionModel> get menuList;
  @override
  @JsonKey(ignore: true)
  _$$MenuPageStateImplCopyWith<_$MenuPageStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
