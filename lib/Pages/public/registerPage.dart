import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpodlearn1/Pages/public/login/Form.dart';
import 'package:riverpodlearn1/Pages/public/login/LoginPage.dart';
import 'package:riverpodlearn1/provider/auth.dart';
import 'package:riverpodlearn1/services/navigatorService.dart';

class RegiterScreen extends HookConsumerWidget {
  static const routeName = '/register';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Register '),
        ),
        body: LoginForm());
  }
}
