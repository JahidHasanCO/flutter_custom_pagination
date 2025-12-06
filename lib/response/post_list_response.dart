import 'package:scroll_test/models/post.dart';

class PostListResponse {
  final List<Post>? posts;
  final int? total;
  final int? skip;
  final int? limit;

  PostListResponse({this.posts, this.total, this.skip, this.limit});

  bool get hasMore => (skip ?? 0) + (posts?.length ?? 0) < (total ?? 0);

  factory PostListResponse.fromJson(Map<String, dynamic> json) =>
      PostListResponse(
        posts: json["posts"] == null
            ? []
            : List<Post>.from(json["posts"]!.map((x) => Post.fromJson(x))),
        total: json["total"],
        skip: json["skip"],
        limit: json["limit"],
      );
}
