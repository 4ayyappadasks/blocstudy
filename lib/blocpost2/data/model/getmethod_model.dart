import 'package:flutterblocstudey/blocpost2/domain/entity/getmethod_entity.dart';

class Getmethodmodel extends Getmethodentity {
  Getmethodmodel({
    required  List<Post>posts,
    required total,
    required skip,
    required limit,
  }):super(
    limit: limit,
    posts: posts,
    skip: skip,
    total: total,
  );
  factory Getmethodmodel.fromJson(Map<String, dynamic> json) => Getmethodmodel(
    posts: List<Post>.from(json["posts"].map((x) => Post.fromJson(x))),
    total: json["total"],
    skip: json["skip"],
    limit: json["limit"],
  );
}
