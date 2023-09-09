import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpodlearn1/services/navigatorService.dart';

final counterProvider = StateNotifierProvider<Counter, int>((ref) {
  return Counter(ref.container);
});

class Counter extends StateNotifier<int> {
    final ProviderContainer _container;
  Counter(this._container) : super(0);
  

  void increment() => state++;
  void decremnent() => state--;
  void navigateTo(screnname) =>_container.read(navigationServiceProvider).navigateTo(screnname);
  void showalert() => {
        // add codd here
        _container.read(navigationServiceProvider).showAlert('Alert', 'API call failed.')
      };
}
