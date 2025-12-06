class Post {
  final int? id;
  final String? title;
  final String? body;
  final List<String>? tags;
  final Reactions? reactions;
  final int? views;
  final int? userId;

  Post({
    this.id,
    this.title,
    this.body,
    this.tags,
    this.reactions,
    this.views,
    this.userId,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
    id: json["id"],
    title: json["title"],
    body: json["body"],
    tags: json["tags"] == null
        ? []
        : List<String>.from(json["tags"]!.map((x) => x)),
    reactions: json["reactions"] == null
        ? null
        : Reactions.fromJson(json["reactions"]),
    views: json["views"],
    userId: json["userId"],
  );
}

class Reactions {
  final int? likes;
  final int? dislikes;

  Reactions({this.likes, this.dislikes});

  factory Reactions.fromJson(Map<String, dynamic> json) =>
      Reactions(likes: json["likes"], dislikes: json["dislikes"]);
}
