part of 'bloctest1_bloc.dart';

@immutable
sealed class test1Event {}

class incvalue extends test1Event {
  final int value;

  incvalue({required this.value});
}

class decvalue extends test1Event {
  final int value;

  decvalue({required this.value});
}
