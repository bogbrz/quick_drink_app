import 'package:bloc/bloc.dart';
import 'package:quick_drink_app/domain/models/dish_model.dart';
import 'package:quick_drink_app/domain/repositories/dishes_repository.dart';

part 'dishes_page_state.dart';

class DishesPageCubit extends Cubit<DishesPageState> {
  DishesPageCubit({required this.dishesRepository})
      : super(
          DishesPageState(
            errorMessage: '',
            dishesList: [],
          ),
        );

  final DishesRepository dishesRepository;

  Future<void> start() async {
    final results = await dishesRepository.getExampleDishes();

    try {
      emit(
        DishesPageState(
          errorMessage: '',
          dishesList: results,
        ),
      );
    } catch (error) {
      emit(
        DishesPageState(
          errorMessage: error.toString(),
          dishesList: [],
        ),
      );
    }
  }
}
