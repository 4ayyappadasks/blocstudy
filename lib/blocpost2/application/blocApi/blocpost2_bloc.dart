import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutterblocstudey/blocpost2/domain/entity/getmethod_entity.dart';
import 'package:flutterblocstudey/blocpost2/domain/usecases/getmethod_usecases.dart';
import 'package:meta/meta.dart';

part 'blocpost2_event.dart';
part 'blocpost2_state.dart';

class post2Bloc extends Bloc<post2Event, post2State> {
  post2Bloc() : super(post2Initial()) {
    on<Getmethodevent>((event, emit) async {
      emit(post2Initial());
      print("blocApi is initialized");
      emit(post2Loading());
      print("blocApi is loading");
      try{
        final data = await Getmethodusecases().Getdatafromdatasource();
        emit(post2GETLoaded(getmethodentity:data));
      }catch(e){
        emit(post2Error(ermsg: e.toString()));
      }
    });
  }
}
