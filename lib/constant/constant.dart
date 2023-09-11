// Base URL
const _BASE_URL = 'https://api.routeme.cc';

class API {
  static const _products = '${_BASE_URL}/enter';
  static var products = _ProductsEndpoints(base: _products);
}

class _ProductsEndpoints {
  final String base;
  _ProductsEndpoints({required this.base});
  String get get => '${base}/public/products'; 
}

