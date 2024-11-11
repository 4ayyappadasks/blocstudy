part of 'blocpage2_bloc.dart';

@immutable
sealed class page2Event {}

class AddData extends page2Event {
  final String data;
  AddData(this.data);
}
