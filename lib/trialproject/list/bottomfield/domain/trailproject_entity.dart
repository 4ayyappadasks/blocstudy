import 'package:equatable/equatable.dart';

class Trialprojectentity extends Equatable {
  int id;
  String title;
  int userId;

  Trialprojectentity({
    required this.id,
    required this.title,
    required this.userId,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        title,
        userId,
      ];
}
