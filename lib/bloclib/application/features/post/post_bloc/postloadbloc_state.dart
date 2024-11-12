part of 'postloadbloc_bloc.dart';

@immutable
sealed class PostloadblocState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class PostloadblocInitial extends PostloadblocState {}

class Postloading extends PostloadblocState {}

class Postloaded extends PostloadblocState {
  Postloaded({required this.post});
  final List<PostEnity>post;
  @override
  List<Object?> get props =>[];
}

class Postloaderror extends PostloadblocState {
  Postloaderror({required this.errormsg});
  final String errormsg;
  @override
  List<Object?> get props =>[];
}
