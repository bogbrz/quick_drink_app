import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'root_page_state.dart';

class RootPageCubit extends Cubit<RootPageState> {
  RootPageCubit() : super(RootPageState(user: null, errorMessage: ""));
  StreamSubscription? streamSubscription;

  Future<void> authStateChanges() async {
    streamSubscription =
        FirebaseAuth.instance.authStateChanges().listen((user) {
      try {
        emit(RootPageState(user: user, errorMessage: ""));
      } catch (error) {
        emit(RootPageState(user: null, errorMessage: error.toString()));
      }
    });
  }
}
