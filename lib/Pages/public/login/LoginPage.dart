import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpodlearn1/Pages/public/login/Form.dart';
import 'package:riverpodlearn1/widgets/myModal.dart';

class LoginScreen extends HookConsumerWidget {
  static const routeName = '/auth';

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: MyModal(
        child: LoginForm(),
      ),
    );
  }
}
