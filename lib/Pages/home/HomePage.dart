import 'package:riverpodlearn1/Pages/profile/Profile.dart';
import 'package:riverpodlearn1/provider/counter_notifier.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpodlearn1/Pages/home/widgets/ProductList.dart';

class MyHomePage extends HookConsumerWidget {
  static final routeName = '/home';
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counterProvider);
    final counterInstance = ref.watch(counterProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body:  ProductListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => counterInstance.increment(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
