import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutterblocstudey/blocpost2/domain/entity/getmethod_entity.dart';
import 'package:flutterblocstudey/blocpost2/domain/usecases/getmethod_usecases.dart';
import 'package:meta/meta.dart';

import '../../domain/entity/postmethod_entity.dart';

part 'blocpost2_event.dart';
part 'blocpost2_state.dart';

class post2Bloc extends Bloc<post2Event, post2State> {
  post2Bloc() : super(post2Initial()) {
    /// ..............................get method..........................///
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
    ///..............................post method................................................///
    on<Postmethodevent>((event, emit) async {
      emit(post2Initial());
      print("blocpostApi is initialized");
      emit(post2Loading());
      print("blocpostApi is loading");
      try{
        final data = await Getmethodusecases().Getdatafromdatasource();
        emit(post2POSTLoaded(postmethodentity:data));
      }catch(e){
        emit(post2Error(ermsg: e.toString()));
      }
    });
  }
}
