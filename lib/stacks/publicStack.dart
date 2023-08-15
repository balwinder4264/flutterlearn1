import 'package:flutter/material.dart';
import 'package:riverpodlearn1/Pages/public/login/LoginPage.dart';
import 'package:riverpodlearn1/Pages/public/registerPage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AuthStack extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Navigator(
      initialRoute: '/auth',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/auth':
            return MaterialPageRoute(builder: (context) => LoginScreen());
          case '/register':
            return MaterialPageRoute(builder: (context) => RegiterScreen());
          default:
            return null;
        }
      },
    );
  }
}
