part of 'trailerprojectlist_bloc.dart';

@immutable
sealed class TrailerprojectlistState extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

final class TrailerprojectlistInitial extends TrailerprojectlistState {}
/// get method

final class TrailGetprojectInitial extends TrailerprojectlistState {}
final class TrailGetprojectloading extends TrailerprojectlistState {}
final class TrailGetprojectloaded extends TrailerprojectlistState {
  TrailGetprojectloaded({required this.trailerprojectEntity});
  TrailerprojectEntity trailerprojectEntity;
  @override
  // TODO: implement props
  List<Object?> get props => [trailerprojectEntity];
}
final class TrailGetprojecterror extends TrailerprojectlistState {
  TrailGetprojecterror({required this.ermsg});
  final String ermsg;
  @override
  // TODO: implement props
  List<Object?> get props => [ermsg];
}