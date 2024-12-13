import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bloctest2_event.dart';

part 'bloctest2_state.dart';

class test2Bloc extends Bloc<test2Event, test2State> {
  test2Bloc() : super(Chnagevalue(value: 0)) {
    on<Changevalueevent>((event, emit) {
      if (state is Chnagevalue) {
        final currentValue = (state as Chnagevalue).value;
        emit(Chnagevalue(value: currentValue + event.value));
      }
    });
  }
}
