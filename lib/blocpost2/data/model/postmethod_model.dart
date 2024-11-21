import 'package:flutterblocstudey/blocpost2/domain/entity/postmethod_entity.dart';

class Postmethodmodel extends Postmethodentity{
  Postmethodmodel({required id, required title, required userId}):super(
    id: id,
    title: title,
    userId: userId,
  );
  factory Postmethodmodel.fromJson(Map<String, dynamic> json) => Postmethodmodel(
    id: json["id"],
    title: json["title"],
    userId: json["userId"],
  );
}