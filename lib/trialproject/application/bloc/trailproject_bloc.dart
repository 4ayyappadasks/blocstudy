import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'trailproject_event.dart';
part 'trailproject_state.dart';

class TrailprojectBloc extends Bloc<TrailprojectEvent, TrailprojectState> {
  TrailprojectBloc() : super(TrailprojectInitial()) {
    on<TrailprojectEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
