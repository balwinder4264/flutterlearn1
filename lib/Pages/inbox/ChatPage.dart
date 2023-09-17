import 'package:riverpodlearn1/provider/counter_notifier.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ChatPage extends HookConsumerWidget {
  static const routeName = '/chat';
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counterProvider);
    final counterInstance = ref.watch(counterProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat page'),
      ),
      body: Center(
          child: Column(
        children: [
          Text(
            'My Chat page  && & ',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
         
        ],
      )),
     
    );
  }
}
