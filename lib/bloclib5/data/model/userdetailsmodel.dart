import 'package:flutterblocstudey/bloclib5/domain/Enitity/userdetailsentity.dart';

class UserdetailsModel extends Userdetailsentity {
  UserdetailsModel({
    required success,
    required message,
    required List<Datum> data,
  }) : super(
          success: success,
          message: message,
          data: data,
        );
  factory UserdetailsModel.fromJson(Map<String, dynamic> json) => UserdetailsModel(
    success: json["success"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

}
