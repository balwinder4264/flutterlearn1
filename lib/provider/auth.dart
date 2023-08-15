import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpodlearn1/services/navigatorService.dart';

class AuthState {
  final String errorMessage;

  AuthState({required this.errorMessage});
}

class AuthNotifier extends StateNotifier<AuthState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  AuthNotifier() : super(AuthState(errorMessage: ''));

  Future<void> login({required String email, required String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      // globalNavigationService.navigateTo('/home');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        _setErrorMessage('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        _setErrorMessage('Wrong password provided for that user.');
      }
    }
  }

  void _setErrorMessage(String message) {
    state = AuthState(errorMessage: message);
    Future.delayed(const Duration(seconds: 10), () {
      state = AuthState(errorMessage: '');
    });
  }

  logout() {
    FirebaseAuth.instance.signOut();
  }
}

final authNotifierProvider =
    StateNotifierProvider<AuthNotifier, AuthState>((ref) => AuthNotifier());
