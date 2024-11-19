part of 'userdetails_bloc.dart';

@immutable
sealed class UserdetailsState extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

final class UserdetailsInitial extends UserdetailsState {}
final class UserdetailsLoading extends UserdetailsState {}
final class UserdetailsLoaded extends UserdetailsState {
  UserdetailsLoaded({required this.userdetailsEvent});
  final Userdetailsentity userdetailsEvent;
  @override
  // TODO: implement props
  List<Object?> get props => [userdetailsEvent];
}
final class UserdetailsError extends UserdetailsState {
  UserdetailsError({required this.ermsg});
  final String ermsg;
  @override
  // TODO: implement props
  List<Object?> get props => [ermsg];
}
