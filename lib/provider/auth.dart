import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpodlearn1/provider/product/fetchProductsProvider.dart';
import 'package:riverpodlearn1/provider/tabRouter.dart';

class AuthState {
  final String errorMessage;
  final bool isUserLoggedIn;
  final User? user;

  AuthState({
    required this.errorMessage,
    this.isUserLoggedIn = false,
    this.user=null,
  });
}

class AuthNotifier extends StateNotifier<AuthState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final ProviderContainer _container;

  AuthNotifier(this._container) : super(AuthState(errorMessage: '')) {
    _auth.authStateChanges().listen((user) {
      if (user != null) {
        state = AuthState(errorMessage: '', isUserLoggedIn: true,user: user);
      } else {
        state = AuthState(errorMessage: '', isUserLoggedIn: false,user: null);
      }
    });
  }

  Future<void> login(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Navigator.of(context).pop();
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
      final productsNotifier = _container.read(productsNotifierProvider.notifier);
    productsNotifier.reset();
    selectedIndexController.setIndex(0);
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

final authNotifierProvider = StateNotifierProvider<AuthNotifier, AuthState>(
    (ref) => AuthNotifier(ref.container));
