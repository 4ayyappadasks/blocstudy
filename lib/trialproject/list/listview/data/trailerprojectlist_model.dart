import 'package:flutterblocstudey/trialproject/list/listview/domain/trailerprojectlistentity.dart';

class Trailerprojectlistmodel extends TrailerprojectEntity {
  Trailerprojectlistmodel({
    required posts,
    required total,
    required skip,
    required limit,
  }) : super(
          posts: posts,
          total: total,
          skip: skip,
          limit: limit,
        );
  factory Trailerprojectlistmodel.fromJson(Map<String, dynamic> json) => Trailerprojectlistmodel(
    posts: List<Post>.from(json["posts"].map((x) => Post.fromJson(x))),
    total: json["total"],
    skip: json["skip"],
    limit: json["limit"],
  );
}
