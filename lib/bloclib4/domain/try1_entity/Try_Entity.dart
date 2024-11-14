import 'package:equatable/equatable.dart';

class DummyJsonModel extends Equatable{
  int success;
  String message;
  List<Datum> data;

  DummyJsonModel({
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

class Datum extends Equatable{
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

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}