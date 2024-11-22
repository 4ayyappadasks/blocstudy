import 'package:flutterblocstudey/trialproject/list/bottomfield/domain/trailproject_entity.dart';

class Trialprojectmodel extends Trialprojectentity
{
  Trialprojectmodel({required id, required title, required userId}):super(
    userId: userId,
    title: title,
    id: id
  );
  factory Trialprojectmodel.fromJson(Map<String, dynamic> json) => Trialprojectmodel(
    id: json["id"],
    title: json["title"],
    userId: json["userId"],
  );
}