import 'package:riverpodlearn1/Pages/AuthOrScreen.dart';
import 'package:riverpodlearn1/Pages/addPost/MyAddPostPage.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpodlearn1/services/navigatorService.dart';

class MainAddPostPage extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AuthOrScreen(
      screen: Scaffold(
        body: Navigator(
          initialRoute: '/',
          key: ref.read(navigationServiceProvider).addPostNavigatorKey,
          onGenerateRoute: (RouteSettings settings) {
            WidgetBuilder builder;
            switch (settings.name) {
              case '/':
                builder = (BuildContext context) => MyAddPostPage();
                break;
              default:
                throw Exception('Invalid route: ${settings.name}');
            }
            return MaterialPageRoute(builder: builder, settings: settings);
          },
        ),
      ),
    );
  }
}
