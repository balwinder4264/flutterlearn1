import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:riverpodlearn1/Pages/Favorite/FavoritePage.dart';
import 'package:riverpodlearn1/Pages/profile/Profile.dart';
import 'package:riverpodlearn1/Pages/home/HomePage.dart';
import 'package:riverpodlearn1/provider/counter_notifier.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpodlearn1/services/navigatorService.dart';

class MainFavoritePage extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Navigator(
        initialRoute: '/',
        key: globalNavigationService.favoriteNavigatorKey,
        onGenerateRoute: (RouteSettings settings) {
          WidgetBuilder builder;
          switch (settings.name) {
            case '/':
              builder = (BuildContext context) => MyFavoritePage();
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
