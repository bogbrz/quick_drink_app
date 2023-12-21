part of 'menu_page_cubit.dart';

@freezed
class MenuPageState with _$MenuPageState {
 

  factory MenuPageState(
      {required String errorMessage,
      required List<MenuPositionModel> menuList}) = _MenuPageState;
}
