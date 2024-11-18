part of 'try1_bloc.dart';

@immutable
sealed class Try1State extends Equatable{
  @override
    List<Object?> get props =>[];
}

final class Try1Initial extends Try1State {}
final class Try1loaidng extends Try1State {}
final class Try1loaded extends Try1State {
  Try1loaded({required this.try1entity});
  Try1Entity try1entity;
  @override
  List<Object?> get props => [try1entity];
}
final class Try1error extends Try1State {
  Try1error({required this.msg});
  final String msg;
  @override
  List<Object?> get props =>[msg];
}
