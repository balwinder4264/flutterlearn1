import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodlearn1/services/apiService.dart';
import 'package:riverpodlearn1/constant/constant.dart';
import 'package:riverpodlearn1/models/product.dart';
import 'package:riverpodlearn1/services/authService.dart';

final productsNotifierProvider =
    StateNotifierProvider<ProductsNotifier, ProductsState>((ref) {
  return ProductsNotifier(
    ref.read(apiServiceProvider),
  );
});

class ProductsState {
  final List<Product> products;
  final bool hasMore;
  final int currentPage;
  final Object? error;

  ProductsState(
      {required this.products,
      required this.hasMore,
      required this.currentPage,
      this.error});
}

class ProductsNotifier extends StateNotifier<ProductsState> {
  final ApiService apiService;
  final authService = AuthService();
  ProductsNotifier(this.apiService)
      : super(ProductsState(products: [], hasMore: true, currentPage: 0)) {
  }

  Future<void> fetchNextPage() async {
    if (!state.hasMore) return; // Return if no more pages available
    try {
      final response = await apiService
          .get('${API.products.get}?page=${state.currentPage}');
      final productResponse = ProductResponse.fromJson(response);
      if (productResponse.data.isEmpty) {
        state = ProductsState(
            products: state.products,
            hasMore: false,
            currentPage: state.currentPage + 1);
      } else {
        state = ProductsState(
            products: state.currentPage < 2
                ? productResponse.data
                : [...state.products, ...productResponse.data ?? []],
            hasMore: true,
            currentPage: state.currentPage + 1);
      }
    } catch (error) {
      state = ProductsState(
          products: state.products,
          hasMore: state.hasMore,
          currentPage: state.currentPage,
          error: error);
      // Handle any error, maybe set 'hasMore' to false or show some error message
    }
  }

  void reset() {
    state = ProductsState(products: [], hasMore: true, currentPage: 0);
  }
}
