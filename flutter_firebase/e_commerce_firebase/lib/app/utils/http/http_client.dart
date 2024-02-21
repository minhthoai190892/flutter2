import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class THttpHelper {
  static String _baseUrl =
      "https://your-api-base-url.com"; //replace with your api base url
  /// heler method to make a GET request
  static Future<Map<String, dynamic>> get({required String endpoint}) async {
    final response = await http.get(Uri.parse('$_baseUrl/$endpoint'));
    return _handleResponse(response);
  }

  /// helper method to make a POST request
  static Future<Map<String, dynamic>> post(
      {required String endpoint, required dynamic data}) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/$endpoint'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(data),
    );
    return _handleResponse(response);
  }

  /// helper method to make a PUT request
  static Future<Map<String, dynamic>> put(
      {required String endpoint, required dynamic data}) async {
    final response = await http.put(
      Uri.parse('$_baseUrl/$endpoint'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(data),
    );
    return _handleResponse(response);
  }

  // helper method to make a DELETE request
  static Future<Map<String, dynamic>> delete({required String endpoint}) async {
    final response = await http.delete(Uri.parse('$_baseUrl/$endpoint'));
    return _handleResponse(response);
  }

  static Future<Map<String, dynamic>> _handleResponse(http.Response response) {
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw 'Failed to load data: ${response.statusCode}';
    }
  }
}
