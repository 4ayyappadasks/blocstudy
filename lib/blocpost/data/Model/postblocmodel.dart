import 'package:flutterblocstudey/blocpost/domain/Entity/postblocentity.dart';

class PostblocModell extends PostblocEntity {
  PostblocModell(
      {required id,
      required title,
      required body,
      required tags,
      required reactions,
      required views,
      required userId})
      : super(
          id: id,
          title: title,
          body: body,
          reactions: reactions,
          tags: tags,
          userId: userId,
          views: views,
        );
  factory PostblocModell.fromJson(Map<String, dynamic> json) => PostblocModell(
      id: json["id"],
      title: json["title"],
      body: json["body"],
      tags: List<String>.from(json["tags"].map((x) => x)),
      reactions: Reactions.fromJson(json["reactions"]),
      views: json["views"],
      userId: json["userId"],
  );
}
