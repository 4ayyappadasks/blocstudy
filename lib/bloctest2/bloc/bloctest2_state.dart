part of 'bloctest2_bloc.dart';

@immutable
sealed class test2State {}

class Chnagevalue extends test2State {
  Chnagevalue({required this.value});
  final int value;
}
