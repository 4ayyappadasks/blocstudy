part of 'blocpost2_bloc.dart';

@immutable
sealed class post2State extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

final class post2Initial extends post2State {}
final class post2Loading extends post2State {}
///
final class post2GETLoaded extends post2State {
  post2GETLoaded({required this.getmethodentity});
  final Getmethodentity getmethodentity;
  @override
  // TODO: implement props
  List<Object?> get props => [getmethodentity];
}
///
final class post2POSTLoaded extends post2State {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

final class post2Error extends post2State {
  post2Error({required this.ermsg});
  final String ermsg;
  @override
  // TODO: implement props
  List<Object?> get props => [];
}