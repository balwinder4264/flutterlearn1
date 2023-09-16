import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpodlearn1/Pages/public/login/LoginPage.dart';
import 'package:riverpodlearn1/Pages/public/register/registerPage.dart';
import 'package:riverpodlearn1/services/authService.dart';
import 'package:riverpodlearn1/services/navigatorService.dart';
import 'package:riverpodlearn1/stacks/UserStack.dart';
import 'package:riverpodlearn1/stacks/publicStack.dart';
import 'package:riverpodlearn1/widgets/LoadingWidget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
      home: UserStack(),
      routes: {
        LoginScreen.routeName: (context) => LoginScreen(),
        RegiterScreen.routeName: (context) => RegiterScreen(),
        // Add other routes as required
      },
    );
  }
}
