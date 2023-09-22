import 'package:riverpodlearn1/Pages/AuthOrScreen.dart';
import 'package:riverpodlearn1/Pages/Listing/MyAddPostPage/MyAddPostPage.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpodlearn1/Pages/Listing/MyListingPage/MyListingPage.dart';
import 'package:riverpodlearn1/services/navigatorService.dart';

class MainListingPage extends HookConsumerWidget {
  const MainListingPage({super.key});

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
                builder = (BuildContext context) => const MyListingPage();
                break;
              case MyAddPostPage.routeName:
                builder = (BuildContext context) => const MyAddPostPage();
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
