import 'package:flutterblocstudey/bloclib4/domain/try1_entity/Try_Entity.dart';

class Try1Model extends Try1Entity {
  Try1Model({
    required success,
    required message,
    required List<Datum> data,
  }) : super(
    data: data,
    message: message,
    success: success,
  );

  factory Try1Model.fromJson(Map<String, dynamic> json) => Try1Model(
    success: json["success"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );
}

