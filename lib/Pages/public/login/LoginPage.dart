import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpodlearn1/Pages/public/login/Form.dart';

class LoginScreen extends HookConsumerWidget {
  static final routeName = '/auth';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Login '),
        ),
        body: LoginForm());
  }
}
