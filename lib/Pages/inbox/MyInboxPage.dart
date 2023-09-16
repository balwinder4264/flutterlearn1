import 'package:riverpodlearn1/Pages/AuthOrScreen.dart';
import 'package:riverpodlearn1/Pages/inbox/ChatPage.dart';
import 'package:riverpodlearn1/provider/counter_notifier.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpodlearn1/services/navigatorService.dart';

class MyInboxPage extends HookConsumerWidget {
  static final routeName = '/inbox';
  const MyInboxPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counterProvider);
    final counterInstance = ref.watch(counterProvider.notifier);

    return AuthOrScreen(
        screen: Scaffold(
      appBar: AppBar(
        title: Text('My Inbox page'),
      ),
      body: Center(
          child: Column(
        children: [
          Text(
            'My Inbox page  && & ',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          ElevatedButton(
            onPressed: () => ref
                .read(navigationServiceProvider)
                .navigateTo(ChatPage.routeName),
            child: Text(
              'Go to Chat Page',
              style: TextStyle(color: Colors.white),
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blue),
            ),
          ),
        ],
      )),
    ));
  }
}
