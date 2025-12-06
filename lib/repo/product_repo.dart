import 'dart:convert';

import 'package:scroll_test/config/constants.dart';
import 'package:scroll_test/network/api_client.dart';
import 'package:scroll_test/response/product_list_response.dart';

class ProductRepo {
  final _client = ApiClient();

  Future<ProductListResponse?> getProducts(int limit, int skip) async {
    final url = '$productUrl?limit=$limit&skip=$skip';
    final response = await _client.futureGet(url: url);
    if (response != null && response.statusCode == 200) {
      final body = response.body;
      return ProductListResponse.fromJson(jsonDecode(body));
    } else {
      return null;
    }
  }
}
