import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {

  Future<Map<String, dynamic>> get(String endpoint) async {
    final response = await http.get(Uri.parse(endpoint));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  // You can similarly implement POST, PUT, DELETE methods here...
}
