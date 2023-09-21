import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodlearn1/services/apiService.dart';
import 'package:riverpodlearn1/constant/constant.dart';
import 'package:riverpodlearn1/models/product.dart';
import 'package:riverpodlearn1/services/authService.dart';

final categoryProvider =
    StateNotifierProvider<CategoryNotifier, CategoryState>((ref) {
  return CategoryNotifier(
    ref.read(apiServiceProvider),
  );
});

class CategoryState {
  final List<Product> category;
  final bool hasMore;
  final int currentPage;
  final Object? error;

  CategoryState(
      {required this.category,
      required this.hasMore,
      required this.currentPage,
      this.error});
}

class CategoryNotifier extends StateNotifier<CategoryState> {
  final ApiService apiService;
  final authService = AuthService();
  CategoryNotifier(this.apiService)
      : super(CategoryState(category: [], hasMore: true, currentPage: 0)) {
    // fetchNextPage();
  }

  Future<void> fetchNextPage() async {
    if (!state.hasMore) return; // Return if no more pages available
    try {
      final response =
          await apiService.get('${API.products.get}?page=${state.currentPage}');
      final categoryResponse = ProductResponse.fromJson(response);
      if (categoryResponse.data.isEmpty) {
        state = CategoryState(
            category: state.category,
            hasMore: false,
            currentPage: state.currentPage + 1);
      } else {
        state = CategoryState(
            category: state.currentPage < 2
                ? categoryResponse.data
                : [...state.category, ...categoryResponse.data ?? []],
            hasMore: true,
            currentPage: state.currentPage + 1);
      }
    } catch (error) {
      state = CategoryState(
          category: state.category,
          hasMore: state.hasMore,
          currentPage: state.currentPage,
          error: error);
      // Handle any error, maybe set 'hasMore' to false or show some error message
    }
  }

  void reset() {
    state = CategoryState(category: [], hasMore: true, currentPage: 0);
  }
}
