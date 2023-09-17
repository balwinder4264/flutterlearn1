import 'package:riverpodlearn1/Pages/profile/Profile.dart';
import 'package:riverpodlearn1/Pages/home/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpodlearn1/services/navigatorService.dart';

class MainHomePage extends HookConsumerWidget {
  const MainHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        body: Navigator(
          initialRoute: '/',
        key:ref.read(navigationServiceProvider).homeNavigatorKey,
          onGenerateRoute: (RouteSettings settings) {
            WidgetBuilder builder;
            switch (settings.name) {
              case '/':
                builder = (BuildContext context) => const MyHomePage();
                break;
              case MyProfilepage.routeName:
                builder = (BuildContext context) => const MyProfilepage();
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
