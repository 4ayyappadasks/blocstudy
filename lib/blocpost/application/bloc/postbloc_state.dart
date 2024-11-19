part of 'postbloc_bloc.dart';

@immutable
sealed class PostblocState extends Equatable{
  @override
  List<Object?> get props =>[];
}

final class PostblocInitial extends PostblocState {}
final class Postblocloading extends PostblocState {}
final class Postblocloaded extends PostblocState {
  Postblocloaded({required this.postblocEntity});
  PostblocEntity postblocEntity;
  @override
  List<Object?> get props =>[postblocEntity];
}
final class Postblocerror extends PostblocState {
  Postblocerror({required this.errmsg});
  final String errmsg;
  @override
  List<Object?> get props =>[errmsg];
}
