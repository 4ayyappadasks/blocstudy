class TrailerprojectEntity {
  List<Post> posts;
  int total;
  int skip;
  int limit;

  TrailerprojectEntity({
    required this.posts,
    required this.total,
    required this.skip,
    required this.limit,
  });

}

class Post {
  int id;
  String title;
  String body;
  List<String> tags;
  Reactions reactions;
  int views;
  int userId;

  Post({
    required this.id,
    required this.title,
    required this.body,
    required this.tags,
    required this.reactions,
    required this.views,
    required this.userId,
  });
  factory Post.fromJson(Map<String, dynamic> json) => Post(
    id: json["id"],
    title: json["title"],
    body: json["body"],
    tags: List<String>.from(json["tags"].map((x) => x)),
    reactions: Reactions.fromJson(json["reactions"]),
    views: json["views"],
    userId: json["userId"],
  );
}

class Reactions {
  int likes;
  int dislikes;

  Reactions({
    required this.likes,
    required this.dislikes,
  });
  factory Reactions.fromJson(Map<String, dynamic> json) => Reactions(
    likes: json["likes"],
    dislikes: json["dislikes"],
  );
}
