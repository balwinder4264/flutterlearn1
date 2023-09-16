import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodlearn1/provider/tabRouter.dart';

final navigationServiceProvider = Provider<NavigationService>((ref) {
  return NavigationService(ref);
});

class NavigationService {
  final ProviderRef ref;
  final GlobalKey<NavigatorState> homeNavigatorKey =
      GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> favoriteNavigatorKey =
      GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> addPostNavigatorKey =
      GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> inboxNavigatorKey =
      GlobalKey<NavigatorState>();
    final GlobalKey<NavigatorState> publicNavigatorKey =
      GlobalKey<NavigatorState>();

  NavigationService(this.ref);

  GlobalKey<NavigatorState> get currentNavigatorKey {
    final currentTabIndex = ref.read(tabIndexProvider).selectedIndexProvider;
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

  Future<void> navigateTo(String screenName) {
    return currentNavigatorKey.currentState!.pushNamed(screenName);
  }

  void pop() {
   return currentNavigatorKey.currentState!.pop();
  }

  void showAlert(String title, String message) {
    showDialog(
      context: currentNavigatorKey.currentContext!,
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
