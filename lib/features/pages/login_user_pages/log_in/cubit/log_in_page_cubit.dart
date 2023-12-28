import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:quick_drink_app/app/core/enums.dart';

part 'log_in_page_state.dart';

class LogInPageCubit extends Cubit<LogInPageState> {
  LogInPageCubit()
      : super(LogInPageState(
           errorMessage: "", status: Status.initial));

  Future<void> signInWitEmailAndPassword(
      {required String email, required String password}) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } catch (error) {
      print(error);
    }
  }

  Future<void> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
  }
}

