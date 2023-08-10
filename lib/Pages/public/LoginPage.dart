import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpodlearn1/Pages/public/registerPage.dart';
import 'package:riverpodlearn1/provider/auth.dart';
import 'package:riverpodlearn1/services/navigatorService.dart';

class LoginScreen extends HookConsumerWidget {
  final routeName = '/auth';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(AuthenticationProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login '),
      ),
      body: Column(
        children: [
          Text("I am Login screen "),
          ElevatedButton(
              onPressed: () => authState.login(), child: Text("Login")),
          ElevatedButton(
            onPressed: () =>
                globalNavigationService.navigateTo(RegiterScreen.routeName),
            child: Text("Go to register screen "),
          ),
        ],
      ),
    );
  }
}
