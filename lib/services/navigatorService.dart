import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final navigationServiceProvider = Provider<NavigationService>((ref) {
  return NavigationService();
});


class NavigationService {
  final GlobalKey<NavigatorState> homeNavigatorKey = GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> favoriteNavigatorKey = GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> addPostNavigatorKey = GlobalKey<NavigatorState>();
  static final NavigationService _instance = NavigationService._internal();

  factory NavigationService() {
    return _instance;
  }

  NavigationService._internal();
  Future<void> navigateTo(String screenName,GlobalKey<NavigatorState> key) {
    return key.currentState!.pushNamed(screenName);
  }

  void showAlert(String title, String message,GlobalKey<NavigatorState> key) {
    showDialog(
      context: key
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
