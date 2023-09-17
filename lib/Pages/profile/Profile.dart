import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpodlearn1/Pages/AuthOrScreen.dart';
import 'package:riverpodlearn1/provider/auth.dart';


class MyProfilepage extends HookConsumerWidget {
  static const routeName = '/profile';
  const MyProfilepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authNotifierProvider.notifier);
    return AuthOrScreen(
        screen: Scaffold(
      appBar: AppBar(
        title: const Text('Prfile'),
      ),
      body: Center(
          child: Column(
        children: [
          Text(
            'My Profile',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          ElevatedButton(
            onPressed: () => {authState.logout()},
            child: const Text('Logout'),
          )
        ],
      )),
    ));
  }
}
