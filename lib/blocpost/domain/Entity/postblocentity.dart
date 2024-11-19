class PostblocEntity {
  int id;
  String title;
  String body;
  List<String> tags;
  Reactions reactions;
  int views;
  int userId;

  PostblocEntity({
    required this.id,
    required this.title,
    required this.body,
    required this.tags,
    required this.reactions,
    required this.views,
    required this.userId,
  });

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
