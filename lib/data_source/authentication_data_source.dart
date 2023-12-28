import 'package:firebase_auth/firebase_auth.dart';


class AuthenticationRepository {
  Stream<User?> authStateChagnes() {
    return FirebaseAuth.instance.authStateChanges();
  }
}
