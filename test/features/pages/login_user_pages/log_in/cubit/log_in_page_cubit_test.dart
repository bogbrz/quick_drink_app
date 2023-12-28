
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:quick_drink_app/domain/repositories/authentication_repository.dart';
import 'package:quick_drink_app/features/pages/login_user_pages/log_in/cubit/log_in_page_cubit.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late MockAuthRepository repository;
  late LogInPageCubit sut;
  setUp(() {
    repository = MockAuthRepository();
    sut = LogInPageCubit(authRepository: repository);
  });

  group("signInWithEmailAndPassword", () {
    test("should call  authRepository.signInWitEmailAndPassword()", () async {
      when(
        () => repository.signInWitEmailAndPassword(
            email: "email", password: "password"),
      ).thenAnswer((_) async => Stream.value([]));
      await sut.signInWitEmailAndPassword(email: "email", password: "password");
      verify(
        () => repository.signInWitEmailAndPassword(
            email: "email", password: "password"),
      ).called(1);
    });
  });
  group("createUserWithEmailAndPassword", () {
    test("should call  authRepository.createUserWithEmailAndPassword()",
        () async {
      when(
        () => repository.createUserWithEmailAndPassword(
            email: "email", password: "password"),
      ).thenAnswer((_) async => Stream.value([]));
      await sut.createUserWithEmailAndPassword(
          email: "email", password: "password");
      verify(
        () => repository.createUserWithEmailAndPassword(
            email: "email", password: "password"),
      ).called(1);
    });
  });
}
