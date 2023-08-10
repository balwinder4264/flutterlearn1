import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpodlearn1/provider/auth.dart';
import 'package:riverpodlearn1/services/navigatorService.dart';
import 'package:riverpodlearn1/stacks/UserStack.dart';
import 'package:riverpodlearn1/stacks/publicStack.dart';

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
    final authState = ref.watch(AuthenticationProvider);
    return MaterialApp(home: authState ? UserStack() : AuthStack());
  }
}
