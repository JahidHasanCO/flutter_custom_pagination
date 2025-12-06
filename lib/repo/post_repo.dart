import 'dart:convert';

import 'package:scroll_test/config/constants.dart';
import 'package:scroll_test/network/api_client.dart';
import 'package:scroll_test/response/post_list_response.dart';

class PostRepo {
  final _client = ApiClient();

  Future<PostListResponse?> getPosts(int limit, int skip) async {
    final url = '$postUrl?limit=$limit&skip=$skip';

    final response = await _client.futureGet(url: url);
    if (response != null && response.statusCode == 200) {
      final body = response.body;
      return PostListResponse.fromJson(jsonDecode(body));
    } else {
      return null;
    }
  }
}
