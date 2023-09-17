import 'package:flutter/material.dart';
import 'package:riverpodlearn1/Pages/public/login/LoginPage.dart';
import 'package:riverpodlearn1/Pages/public/register/registerPage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AuthStack extends HookConsumerWidget {
  const AuthStack({super.key});

  @override
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Auth Stack'),
        ),
        body: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                 
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (BuildContext context) {
                      return const LoginScreen();
                    },
                  );
                },
                child: const Text('Log In'),
              ),
              ElevatedButton(
                onPressed: () {
                
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (BuildContext context) {
                      return const RegiterScreen();
                    },
                  );
                },
                child: const Text('Register'),
              ),
            ],
          ),
        ));
  }
}
