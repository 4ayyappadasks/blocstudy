import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bloctest1_event.dart';
part 'bloctest1_state.dart';

class test1Bloc extends Bloc<test1Event, test1State> {
  int _currentValue = 0;

  test1Bloc() : super(test1Initial()) {
    on<incvalue>((event, emit) {
      _currentValue += event.value;
      emit(ValueChangedState(value: _currentValue));
    });

    on<decvalue>((event, emit) {
      _currentValue -= event.value;
      emit(ValueChangedState(value: _currentValue));
    });
  }
}
