import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpodlearn1/services/navigatorService.dart';

final counterProvider = StateNotifierProvider<Counter, int>((ref) {
  return Counter();
});

class Counter extends StateNotifier<int> {
  Counter() : super(0);

  void increment() => state++;
  void decremnent() => state--;
  void navigateTo(screnname) => globalNavigationService.navigateTo(screnname);
  void showalert() => {
        // add codd here
        globalNavigationService.showAlert('Alert', 'API call failed.')
      };
}
