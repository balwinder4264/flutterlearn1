import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodlearn1/provider/tabRouter.dart';


class NavigationService {
  final GlobalKey<NavigatorState> homeNavigatorKey = GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> favoriteNavigatorKey = GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> addPostNavigatorKey = GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> inboxNavigatorKey = GlobalKey<NavigatorState>();
  static final NavigationService _instance = NavigationService._internal();
  late ProviderContainer container; // I

 GlobalKey<NavigatorState> get currentNavigatorKey {
    final currentTabIndex = container.read(tabIndexProvider).selectedIndexProvider;
    switch (currentTabIndex) {
      case 0:
        return homeNavigatorKey;
      case 1:
        return favoriteNavigatorKey;
      case 2:
        return addPostNavigatorKey;
      case 3:
        return inboxNavigatorKey;
      default:
        return homeNavigatorKey;
    }
  }
  factory NavigationService() {
    return _instance;
  }

  NavigationService._internal(): container = ProviderContainer();
  Future<void> navigateTo(String screenName) {
    return currentNavigatorKey.currentState!.pushNamed(screenName);
  }

  void showAlert(String title, String message) {
    showDialog(
      context: currentNavigatorKey
          .currentContext!, // Use the current context from the navigator key
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            child: Text('OK'),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }
}

final globalNavigationService = NavigationService();
