import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:quick_drink_app/domain/models/dishes_model.dart';
import 'package:quick_drink_app/domain/repositories/dishes_repository.dart';

part 'menu_page_state.dart';

class MenuPageCubit extends Cubit<MenuPageState> {
  MenuPageCubit({required this.dishesRepository})
      : super(MenuPageState(errorMessage: '', dishesList: []));

  final DishesRepository dishesRepository;

  Future<void> start() async {
    final results = await dishesRepository.getDishes();

    try {
      emit(
        MenuPageState(
          errorMessage: '',
          dishesList: results,
        ),
      );
    } catch (error) {
      emit(
        MenuPageState(
          errorMessage: error.toString(),
          dishesList: [],
        ),
      );
    }
  }
}
