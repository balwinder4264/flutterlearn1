import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodlearn1/services/apiService.dart';
import 'package:riverpodlearn1/constant/constant.dart';
import 'package:riverpodlearn1/models/product.dart';

final productsProvider = FutureProvider<ProductResponse>((ref) async {
  final apiService = ref.read(apiServiceProvider);
  final response = await apiService.get(API.products.get);
  return ProductResponse.fromJson(response);
});


final apiServiceProvider = Provider<ApiService>((ref) => ApiService());
