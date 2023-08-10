import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final navigationServiceProvider = Provider<NavigationService>((ref) {
  return NavigationService();
});

final navigatorProvider = Provider.family<void, String>((ref, routeName) {
  final navigationService = ref.read(navigationServiceProvider);
  navigationService.navigateTo(routeName);
});

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static final NavigationService _instance = NavigationService._internal();

  factory NavigationService() {
    return _instance;
  }

  NavigationService._internal();
  Future<void> navigateTo(String screenName) {
    print(screenName);
    return navigatorKey.currentState!.pushNamed(screenName);
  }

  void showAlert(String title, String message) {
    showDialog(
      context: navigatorKey
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
