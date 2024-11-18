import 'package:equatable/equatable.dart';

class Try1Entity extends Equatable{
  int success;
  String message;
  List<Datum> data;

  Try1Entity({
    required this.success,
    required this.message,
    required this.data,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    success,message,data
  ];

}

class Datum extends Equatable {
  DateTime createdAt;
  String name;
  String avatar;
  String id;

  Datum({
    required this.createdAt,
    required this.name,
    required this.avatar,
    required this.id,
  });

  factory Datum.fromJson(Map<String, dynamic> json) {
    return Datum(
      createdAt: DateTime.parse(json["createdAt"]),
      name: json["name"],
      avatar: json["avatar"],
      id: json["id"],
    );
  }

  @override
  List<Object?> get props => [
    createdAt,
    name,
    avatar,
    id,
  ];
}
