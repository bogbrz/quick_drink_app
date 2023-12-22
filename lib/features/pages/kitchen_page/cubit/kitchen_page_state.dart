part of 'kitchen_page_cubit.dart';
@freezed
class KitchenPageState with _$KitchenPageState {
 
 

 factory KitchenPageState({
    required String errorMessage,
    required List<ToDoModel> orders,
    required Status status
   
  }) = _KitchenPageState;
}
