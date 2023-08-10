import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:riverpodlearn1/provider/counter_notifier.dart';

class MyProfilepage extends HookConsumerWidget {
  const MyProfilepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counterInstance = ref.watch(counterProvider.notifier);
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
            onPressed: () => {counterInstance.navigateTo('/')},
            child: Text('Go to Home page '),
          )
        ],
      )),
    );
  }
}
