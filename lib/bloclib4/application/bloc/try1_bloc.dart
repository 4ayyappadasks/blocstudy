import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutterblocstudey/bloclib4/domain/try1_entity/Try_Entity.dart';
import 'package:flutterblocstudey/bloclib4/domain/try1_usecases/try1_usecases.dart';
import 'package:meta/meta.dart';

part 'try1_event.dart';
part 'try1_state.dart';

class Try1Bloc extends Bloc<Try1Event, Try1State> {
  Try1Bloc() : super(Try1Initial()) {
    on<Loadapievent>((event, emit) async{
      print("bloc is initialized");
      emit(Try1loaidng());
      print("bloc is loading");
      try{
        final loaddata = await Try1UseCases().GetDataFromDataSource();
        emit(Try1loaded(try1entity: loaddata));
      }
          catch(e){
        emit(Try1error(msg: "Error msg : ${e}"));
        print("Error in Bloc: $e");
          }
    });
  }
}
