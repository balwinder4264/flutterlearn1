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

  Future<void> navigateTo(String routeName) {
    return navigatorKey.currentState!.pushNamed(routeName);
  }
}


final globalNavigationService = NavigationService();
