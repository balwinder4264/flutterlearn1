import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final userStream = FirebaseAuth.instance.authStateChanges();
  final user = FirebaseAuth.instance.currentUser;

  void updateUser({name}) async {
    await user?.updateDisplayName(name);
  }

  logout() {
    FirebaseAuth.instance.signOut();
  }

  Future<String?> getFirebaseToken() async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      final tokenResult = await user.getIdTokenResult();
      return tokenResult.token;
    }

    return null;
  }
}
