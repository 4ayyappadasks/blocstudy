import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'bottmsheet_event.dart';
part 'bottmsheet_state.dart';

class BottmsheetBloc extends Bloc<BottmsheetEvent, BottmsheetState> {
  BottmsheetBloc() : super(BottmsheetInitial()) {
    on<showBottomSheetEvent>((event, emit) {

    });
  }
}
