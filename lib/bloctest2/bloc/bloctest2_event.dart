part of 'bloctest2_bloc.dart';

@immutable
sealed class test2Event {}

class Changevalueevent extends test2Event {
  Changevalueevent({required this.value});
  final int value;
}
