import 'package:hooks_riverpod/hooks_riverpod.dart';

class TabState {
  final int selectedIndexProvider;
  TabState({
    required this.selectedIndexProvider,
  });
}

class TabStateNotifier extends StateNotifier<TabState> {
    final ProviderContainer _container;
  TabStateNotifier(this._container) : super(TabState(selectedIndexProvider: 0));
  void setIndex(int index) {
    state = TabState(selectedIndexProvider: index);
  }
}

final selectedIndexProvider = StateProvider<int>((ref) => 0);

final tabIndexProvider = StateNotifierProvider<TabStateNotifier, TabState>(
    (ref) => TabStateNotifier(ref.container));
