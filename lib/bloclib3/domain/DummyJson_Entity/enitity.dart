import 'package:equatable/equatable.dart';

class DummyJsonEntity extends Equatable {
  final int success;
  final String message;
  final List<DatumEntity> data;

  const DummyJsonEntity({
    required this.success,
    required this.message,
    required this.data,
  });

  @override
  List<Object?> get props => [success, message, data];
}

class DatumEntity extends Equatable {
  DateTime createdAt;
  String name;
  String avatar;
  String id;

   DatumEntity({
     required this.createdAt,
     required this.name,
     required this.avatar,
     required this.id,
  });

  @override
  List<Object?> get props => [
    createdAt,
    name,
    avatar,
    id,
  ];
}
