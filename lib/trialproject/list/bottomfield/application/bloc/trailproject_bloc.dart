import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutterblocstudey/trialproject/list/bottomfield/domain/trailproject_entity.dart';
import 'package:flutterblocstudey/trialproject/list/bottomfield/domain/trailproject_usecases.dart';
import 'package:meta/meta.dart';

import '../../../listview/application/bloc/trailerprojectlist_bloc.dart';
import '../../../listview/domain/trailerprojectlist_usecases.dart';

part 'trailproject_event.dart';

part 'trailproject_state.dart';

class TrailprojectBloc extends Bloc<TrailprojectEvent, TrailprojectState> {
  final TrailerprojectlistBloc trailerprojectlistBloc;

  TrailprojectBloc({required this.trailerprojectlistBloc})
      : super(TrailprojectInitial()) {
    on<Postmethodevent>((event, emit) async {
      emit(TrailprojectInitial());
      print("post bloc is waiting");
      emit(Trailprojectloading());
      print("post bloc is loading");
      try {
        final data =
        await TrialProjectUsecases().functionfordatasource(message: event.message);
        emit(Trailprojectloaded(trialprojectentity: data));
        print("post bloc is loaded");

        // Trigger the list bloc to refresh data
        trailerprojectlistBloc.add(Getmethodevent());
        print("list bloc Getmethodevent dispatched");
      } catch (e) {
        emit(Trailprojecterror(ermsg: "error in bloc is $e"));
        print("post bloc is error");
      }
    });
  }
}

