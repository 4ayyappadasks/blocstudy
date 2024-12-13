part of 'bloctest1_bloc.dart';

@immutable
sealed class test1State {}

class test1Initial extends test1State {}

class ValueChangedState extends test1State {
  final int value;

  ValueChangedState({required this.value});
}
