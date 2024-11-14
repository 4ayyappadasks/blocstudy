import 'dart:convert';
import 'package:flutterblocstudey/bloclib3/domain/DummyJson_Entity/enitity.dart';

class DummyJsonModel extends DummyJsonEntity {
  DummyJsonModel({
    required int success,
    required String message,
    required List<DatumModel> data,
  }) : super(
    success: success,
    message: message,
    data: data,
  );

  factory DummyJsonModel.fromRawJson(String str) =>
      DummyJsonModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DummyJsonModel.fromJson(Map<String, dynamic> json) => DummyJsonModel(
    success: json["success"],
    message: json["message"],
    data: List<DatumModel>.from(json["data"].map((x) => DatumModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => (x as DatumModel).toJson())),
  };
}

class DatumModel extends DatumEntity {
  DatumModel({
    required createdAt,
    required name,
    required avatar,
    required id,
  }) : super(
    id: id,
    avatar: avatar,
    createdAt: createdAt,
    name: name,
  );

  factory DatumModel.fromJson(Map<String, dynamic> json) => DatumModel(
    createdAt: DateTime.parse(json["createdAt"]),
    name: json["name"],
    avatar: json["avatar"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "createdAt": createdAt.toIso8601String(),
    "name": name,
    "avatar": avatar,
    "id": id,
  };
}
