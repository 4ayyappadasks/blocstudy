import 'package:flutterblocstudey/bloclib2/domain/enitities/MockApi_enitities.dart';

class MockApiModel extends MockApiEnities {
  MockApiModel(
      {required createdAt, required name, required avatar, required id})
      : super(
          createdAt: createdAt,
          name: name,
          avatar: avatar,
          id: id,
        );

  factory MockApiModel.fromJson(Map<String, dynamic> json) {
    return MockApiModel(
      createdAt: json["createdAt"],
      name: json["name"],
      avatar: json["avatar"],
      id: json["id"],
    );
  }
}
