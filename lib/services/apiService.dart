import 'dart:convert';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:riverpodlearn1/services/authService.dart';
import 'package:riverpodlearn1/models/custom_error.dart';

class ApiService {
  final authService = AuthService();
  Future<Map<String, dynamic>> get(String endpoint) async {
    final token = await authService.getFirebaseToken();
    Map<String, String> headers = {"Content-Type": "application/json"};
    if (token != null) {
      headers["Authorization"] = "Bearer $token";
    }

    try {
      final response = await http.get(Uri.parse(endpoint), headers: headers);
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (error) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> post(
      String endpoint, Map<String, dynamic> data) async {
    final token = await authService.getFirebaseToken();
    Map<String, String> headers = {"Content-Type": "application/json"};
    if (token != null) {
      headers["Authorization"] = "Bearer $token";
    }

    try {
      final response = await http.post(
        Uri.parse(endpoint),
        headers: headers,
        body: json.encode(data),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return json.decode(response.body);
      } else {
        final error = CustomError.fromJson(json.decode(response.body));
        throw error;
      }
    } catch (error) {
      rethrow;
    }
  }

  // You can similarly implement POST, PUT, DELETE methods here...
}

final apiServiceProvider = Provider<ApiService>((ref) => ApiService());
