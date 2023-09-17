import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpodlearn1/Pages/public/login/LoginPage.dart';
import 'package:riverpodlearn1/Pages/public/register/registerPage.dart';
import 'package:riverpodlearn1/stacks/UserStack.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      home: UserStack(),
      routes: {
        LoginScreen.routeName: (context) => const LoginScreen(),
        RegiterScreen.routeName: (context) => const RegiterScreen(),
        // Add other routes as required
      },
    );
  }
}
