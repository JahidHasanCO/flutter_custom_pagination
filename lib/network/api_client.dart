import 'dart:async';
import 'package:http/http.dart' as http;

class ApiClient {
  static final ApiClient _instance = ApiClient._internal();
  ApiClient._internal();
  factory ApiClient() => _instance;

  final _headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  Future<http.Response?> futureGet({
    required String url,
    Map<String, String>? headers,
  }) async {
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: headers ?? _headers,
      );
      return response;
    } catch (exception) {
      return null;
    }
  }
}
