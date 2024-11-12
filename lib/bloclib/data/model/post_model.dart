import 'package:flutterblocstudey/bloclib/domin/entities/post_entity.dart';

class PostModel extends PostEnity {
  PostModel({required id, required userid, required body, required title})
      : super(id: id, body: body, title: title, userid: userid);

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
        id: json["it"],
        userid: json["userId"],
        body: json["body"],
        title: json["title"]);
  }
}
