import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutterblocstudey/trialproject/list/listview/domain/trailerprojectlist_usecases.dart';
import 'package:flutterblocstudey/trialproject/list/listview/domain/trailerprojectlistentity.dart';
import 'package:meta/meta.dart';

part 'trailerprojectlist_event.dart';
part 'trailerprojectlist_state.dart';

class TrailerprojectlistBloc extends Bloc<TrailerprojectlistEvent, TrailerprojectlistState> {
  TrailerprojectlistBloc() : super(TrailerprojectlistInitial()) {
    on<Getmethodevent>((event, emit) async{
      emit(TrailerprojectlistInitial());
      print("bloc of list is waiting");
      emit(TrailGetprojectloading());
      print("bloc of list is loading");
      try{
        final data = await TrailerprojectUsercase().functionfordatasources();
        emit(TrailGetprojectloaded(trailerprojectEntity: data));
      }
          catch(e)
      {
        emit(TrailGetprojecterror(ermsg: "error in bloc ${e}"));
      }
    });
  }
}
