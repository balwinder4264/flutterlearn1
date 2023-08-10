import 'package:riverpodlearn1/provider/counter_notifier.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyHomePage extends HookConsumerWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counterProvider);
    final counterInstance = ref.watch(counterProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod counter example'),
      ),
      body: Center(
          child: Column(
        children: [
          Text(
            '$count',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          ElevatedButton(
            onPressed: () => counterInstance.navigateTo('/profile'),
            child: Text('Go to profile'),
          ),
          ElevatedButton(
            onPressed: () => counterInstance.showalert(),
            child: Text('Show Alert'),
          )
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () => counterInstance.increment(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
