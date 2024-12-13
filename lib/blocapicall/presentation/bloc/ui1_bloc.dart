import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'ui1_event.dart';
part 'ui1_state.dart';

class Ui1Bloc extends Bloc<Ui1Event, Ui1State> {
  Ui1Bloc() : super(Ui1Initial()) {
    on<Ui1Event>((event, emit) {
      // TODO: implement event handler
    });
  }
}
