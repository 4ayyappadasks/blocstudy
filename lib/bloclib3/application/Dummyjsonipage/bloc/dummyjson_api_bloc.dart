import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutterblocstudey/bloclib3/domain/DummyJson_Entity/enitity.dart';
import 'package:flutterblocstudey/bloclib3/domain/DummyJson_Usecases/usecases.dart';
import 'package:meta/meta.dart';

part 'dummyjson_api_event.dart';
part 'dummyjson_api_state.dart';

class DummyjsonApiBloc extends Bloc<DummyjsonApiEvent, DummyjsonApiState> {
  DummyjsonApiBloc() : super(DummyjsonApiInitial()) {
    on<LoadDemoApidataEvent>((event, emit) async {
      log("Bloc initialized");
      emit(DummyjsonApiLoading());
      log("Bloc loading");

      try {
        // Await the use case result to ensure `loaddata` is a List<DatumEntity>
        final loaddata = await DummyApiUsecases().GetTriggerDataSource();

        // Emit the loaded state with the list
        emit(DummyjsonApiLoaded(data: loaddata));
      } catch (e) {
        emit(DummyjsonApiError(errormsg: "Error in Bloc: $e"));
        log("Error in Bloc: $e");
      }
    });
  }
}
