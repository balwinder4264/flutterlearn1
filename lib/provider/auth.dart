import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpodlearn1/provider/tabRouter.dart';
import 'package:riverpodlearn1/services/navigatorService.dart';

class AuthState {
  final String errorMessage;
  final bool isUserLoggedIn;

  AuthState({
    required this.errorMessage,
    this.isUserLoggedIn = false,
  });
}

class AuthNotifier extends StateNotifier<AuthState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final ProviderContainer _container;

  AuthNotifier(this._container) : super(AuthState(errorMessage: '')) {
    _auth.authStateChanges().listen((user) {
      if (user != null) {
        state = AuthState(errorMessage: '', isUserLoggedIn: true);
      } else {
        state = AuthState(errorMessage: '', isUserLoggedIn: false);
      }
    });
  }

  Future<void> login({required String email, required String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
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

  logout() async {
    await FirebaseAuth.instance.signOut();
    final selectedIndexController = _container.read(tabIndexProvider.notifier);
    selectedIndexController.setIndex(0);
  }

  Future<String?> getFirebaseToken() async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      final tokenResult = await user.getIdTokenResult();
      print("token  ==>${tokenResult.token}");
      return tokenResult.token;
    }

    return null;
  }
}

final authNotifierProvider = StateNotifierProvider<AuthNotifier, AuthState>(
    (ref) => AuthNotifier(ref.container));
