import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpodlearn1/Pages/HomePage.dart';
import 'package:riverpodlearn1/Profile.dart';

import 'package:riverpodlearn1/services/navigatorService.dart';

void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      navigatorKey: ref.read(navigationServiceProvider).navigatorKey,
      home: MyHomePage(),
      routes: {
        '/home': (context) => MyHomePage(),
        '/profile': (context) => MyProfilepage()
      },
    );
  }
}
