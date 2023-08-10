import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpodlearn1/provider/auth.dart';

import 'package:riverpodlearn1/provider/counter_notifier.dart';
import 'package:riverpodlearn1/services/navigatorService.dart';

class MyProfilepage extends HookConsumerWidget {
  const MyProfilepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(AuthenticationProvider.notifier);
    return Scaffold(
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
            child: Text('Logout'),
          )
        ],
      )),
    );
  }
}
