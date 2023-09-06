import 'package:riverpodlearn1/provider/counter_notifier.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpodlearn1/services/navigatorService.dart';

class MyFavoritePage extends HookConsumerWidget {
  static final routeName = '/Favorite';
  const MyFavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counterProvider);
    final counterInstance = ref.watch(counterProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite'),
      ),
      body: Center(
          child: Column(
        children: [
          Text(
            'This is my MyFavorite Page',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
         
        ],
      )),
     
    );
  }
}
