import 'package:riverpodlearn1/Pages/Profile.dart';
import 'package:riverpodlearn1/Pages/home/HomePage.dart';
import 'package:riverpodlearn1/provider/counter_notifier.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpodlearn1/services/navigatorService.dart';

class MainHomePage extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Navigator(
        key: globalNavigationService.navigatorKey,
        initialRoute: '/',
        onGenerateRoute: (RouteSettings settings) {
          WidgetBuilder builder;
          switch (settings.name) {
            case '/':
              builder = (BuildContext context) => MyHomePage();
              break;
            case '/profile':
              builder = (BuildContext context) => MyProfilepage();
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
