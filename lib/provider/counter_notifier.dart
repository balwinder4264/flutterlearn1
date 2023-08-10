import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpodlearn1/services/navigatorService.dart';

final counterProvider = StateNotifierProvider<Counter, int>((ref) {
  final navigationService = ref.read(navigationServiceProvider);
  return Counter(navigationService);
});

class Counter extends StateNotifier<int> {
  final NavigationService? globalNavigationService;
  Counter(this.globalNavigationService) : super(0);

  void increment() => state++;
  void decremnent() => state--;
  void navigateTo(screnname) => globalNavigationService?.navigateTo(screnname);
}
