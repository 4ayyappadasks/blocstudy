part of 'trailproject_bloc.dart';

@immutable
sealed class TrailprojectState extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
/// post method
final class TrailprojectInitial extends TrailprojectState {}
final class Trailprojectloading extends TrailprojectState {}
final class Trailprojectloaded extends TrailprojectState {
  Trailprojectloaded({required this.trialprojectentity});
   Trialprojectentity trialprojectentity;
  @override
  // TODO: implement props
  List<Object?> get props => [trialprojectentity];
}
final class Trailprojecterror extends TrailprojectState {
  Trailprojecterror({required this.ermsg});
  final String ermsg;
  @override
  // TODO: implement props
  List<Object?> get props => [ermsg];
}
