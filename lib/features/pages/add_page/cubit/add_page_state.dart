part of 'add_page_cubit.dart';

@freezed
class AddPageState with _$AddPageState {
  factory AddPageState({required String errorMessage,required Status status, required List<MenuPositionModel> postitions}) = _AddPageState;
}
