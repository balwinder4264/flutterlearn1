import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodlearn1/models/category.dart';
import 'package:riverpodlearn1/models/common_response.dart';
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
  final List<Category> category;
  final Object? error;

  CategoryState({required this.category, this.error});
}

class CategoryNotifier extends StateNotifier<CategoryState> {
  final ApiService apiService;
  final authService = AuthService();
  CategoryNotifier(this.apiService)
      : super(CategoryState(
          category: [],
        )) {
    // fetchNextPage();
  }

  Future<void> fetchCategories() async {
    try {
      final response = await apiService.get('${API.products.get}');
      final categoryResponse = CommonResponse.fromJson(response);

      state = CategoryState(category: categoryResponse.data);
    } catch (error) {
      state = CategoryState(category: state.category, error: error);
      // Handle any error, maybe set 'hasMore' to false or show some error message
    }
  }

  void reset() {
    state = CategoryState(category: [], hasMore: true, currentPage: 0);
  }
}
