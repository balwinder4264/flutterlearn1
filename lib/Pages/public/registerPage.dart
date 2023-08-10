import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpodlearn1/Pages/public/LoginPage.dart';
import 'package:riverpodlearn1/provider/auth.dart';
import 'package:riverpodlearn1/services/navigatorService.dart';

class RegiterScreen extends HookConsumerWidget {
  static const routeName = '/register';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(AuthenticationProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register '),
      ),
      body: Column(
        children: [
          Text("I am Login screen "),
          ElevatedButton(
              onPressed: () => authState.login(), child: Text("Login")),
          ElevatedButton(
            onPressed: () =>
                globalNavigationService.navigateTo(LoginScreen().routeName),
            child: Text("Go to Login screen "),
          ),
        ],
      ),
    );
  }
}
