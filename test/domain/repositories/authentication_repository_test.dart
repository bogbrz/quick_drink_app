import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quick_drink_app/data_source/authentication_data_source.dart';
import 'package:quick_drink_app/domain/repositories/authentication_repository.dart';

class MockAuthDataSource extends Mock implements AuthDataSource {}

void main() {
  late MockAuthDataSource dataSource;
  late AuthRepository sut;
  setUp(() {
    dataSource = MockAuthDataSource();
    sut = AuthRepository(authDataSource: dataSource);
  });
  group("SignInWithEmailAndPassword", () {
    test("should call authDataSource.signInWitEmailAndPassword() method once",
        () async {
      when(
        () => dataSource.signInWitEmailAndPassword(
            email: "email", password: "password"),
      ).thenAnswer((_) async => Stream.value([]));

      await sut.signInWitEmailAndPassword(email: "email", password: "password");

      verify(
        () => dataSource.signInWitEmailAndPassword(
            email: "email", password: "password"),
      ).called(1);
    });
  });
  group("CreateUserWithEmailAndPassword", () {
    test(
        "should call authDataSource.CreateUserWitEmailAndPassword() method once",
        () async {
      when(
        () => dataSource.createUserWithEmailAndPassword(
            email: "email", password: "password"),
      ).thenAnswer((_) async => Stream.value([]));

      await sut.createUserWithEmailAndPassword(
          email: "email", password: "password");

      verify(
        () => dataSource.createUserWithEmailAndPassword(
            email: "email", password: "password"),
      ).called(1);
    });
  });
  group("signOut", () {
    test("should call authDataSource.signOut() method once", () async {
      when(
        () => dataSource.signOut(),
      ).thenAnswer((_) async => Stream.value([]));

      await sut.signOut();

      verify(
        () => dataSource.signOut(),
      ).called(1);
    });
  });
}
