import 'package:equatable/equatable.dart';

class MockApiEnities extends Equatable{
  MockApiEnities({
    required this.createdAt,
    required this.name,
    required this.avatar,
    required this.id,
});
  var createdAt;
  var name;
  var avatar;
  var id;
  @override
  List<Object?> get props =>[];
}