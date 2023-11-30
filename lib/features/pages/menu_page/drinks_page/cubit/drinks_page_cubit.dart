import 'package:bloc/bloc.dart';
import 'package:quick_drink_app/domain/models/drink_model.dart';
import 'package:quick_drink_app/domain/repositories/drinks_repository.dart';

part 'drinks_page_state.dart';

class DrinksPageCubit extends Cubit<DrinksPageState> {
  DrinksPageCubit({required this.drinksRepository})
      : super(
          DrinksPageState(
            errorMessage: '',
            drinksList: [],
          ),
        );

  final DrinksRepository drinksRepository;

  Future<void> start() async {
    final results = await drinksRepository.getDrinks();
    try {
      emit(
        DrinksPageState(
          errorMessage: '',
          drinksList: results,
        ),
      );
    } catch (error) {
      emit(
        DrinksPageState(
          errorMessage: error.toString(),
          drinksList: [],
        ),
      );
    }
  }
}
