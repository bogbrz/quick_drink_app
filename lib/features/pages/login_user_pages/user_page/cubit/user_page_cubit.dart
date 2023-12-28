import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_page_state.dart';

class UserPageCubit extends Cubit<UserPageState> {
  UserPageCubit() : super(UserPageState());

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
