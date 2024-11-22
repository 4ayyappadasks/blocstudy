part of 'trailproject_bloc.dart';

@immutable
sealed class TrailprojectEvent extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class Postmethodevent extends TrailprojectEvent{
  Postmethodevent({required this.message});
  final String message;
  @override
  // TODO: implement props
  List<Object?> get props => [message];
}

