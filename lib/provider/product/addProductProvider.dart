import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodlearn1/services/apiService.dart';
import 'package:riverpodlearn1/constant/constant.dart';
import 'package:riverpodlearn1/models/product.dart';
import 'package:riverpodlearn1/models/custom_error.dart';

class AppProductState {
  final bool isLoading;
  final bool? isSuccess;
  final String? errorMessage;

  AppProductState({this.isLoading = false, this.isSuccess, this.errorMessage});
}

class AddProductNotifier extends StateNotifier<AppProductState> {
  final ApiService apiService;

  AddProductNotifier(this.apiService) : super(AppProductState());

  Future<void> addProduct(Product product) async {
    state = AppProductState(isLoading: true);
    try {
      final response =
          await apiService.post(API.products.add, product.toJson());

      state = AppProductState(isLoading: false, isSuccess: true);
    } catch (error) {
      if (error is CustomError) {
        state = AppProductState(isLoading: false, errorMessage: error.message);
        Future.delayed(const Duration(seconds: 5), _clearError);
      } else {
        state =
            AppProductState(isLoading: false, errorMessage: error.toString());
        Future.delayed(const Duration(seconds: 5), _clearError);
      }
    }
  }

  void _clearError() {
    state =
        AppProductState(isLoading: state.isLoading, isSuccess: state.isSuccess);
  }
}

final addProductnProvider =
    StateNotifierProvider<AddProductNotifier, AppProductState>(
        (ref) => AddProductNotifier(ref.read(apiServiceProvider)));
