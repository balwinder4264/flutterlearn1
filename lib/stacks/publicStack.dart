import 'package:flutter/material.dart';
import 'package:riverpodlearn1/Pages/public/login/LoginPage.dart';
import 'package:riverpodlearn1/Pages/public/register/registerPage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpodlearn1/services/navigatorService.dart';

class AuthStack extends HookConsumerWidget {
  @override
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        key: ref.read(navigationServiceProvider).publicNavigatorKey,
        appBar: AppBar(
          title: Text('Auth Stack'),
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
                      return LoginScreen();
                    },
                  );
                },
                child: Text('Log In'),
              ),
              ElevatedButton(
                onPressed: () {
                
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (BuildContext context) {
                      return RegiterScreen();
                    },
                  );
                },
                child: Text('Register'),
              ),
            ],
          ),
        ));
  }
}
