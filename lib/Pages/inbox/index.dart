import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpodlearn1/Pages/inbox/ChatPage.dart';
import 'package:riverpodlearn1/Pages/inbox/MyInboxPage.dart';
import 'package:riverpodlearn1/services/navigatorService.dart';

class MainInboxPage extends HookConsumerWidget {
  const MainInboxPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Navigator(
        initialRoute: '/',
        key: ref.read(navigationServiceProvider).inboxNavigatorKey,
        onGenerateRoute: (RouteSettings settings) {
          WidgetBuilder builder;
          switch (settings.name) {
            case '/':
              builder = (BuildContext context) => const MyInboxPage();
              break;
            case ChatPage.routeName:
              builder = (BuildContext context) => const ChatPage();
              break;
            default:
              throw Exception('Invalid route: ${settings.name}');
          }
          return MaterialPageRoute(builder: builder, settings: settings);
        },
      ),
    );
  }
}
