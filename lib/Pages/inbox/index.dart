
import 'package:riverpodlearn1/Pages/addPost/MyAddPostPage.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpodlearn1/Pages/inbox/MyAddPostPage.dart';
import 'package:riverpodlearn1/services/navigatorService.dart';

class MainInboxPage extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Navigator(
        initialRoute: '/',
        key: globalNavigationService.inboxNavigatorKey,
        onGenerateRoute: (RouteSettings settings) {
          WidgetBuilder builder;
          switch (settings.name) {
            case '/':
              builder = (BuildContext context) => MyInboxPage();
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
