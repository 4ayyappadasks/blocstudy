import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'blocpage2_event.dart';
part 'blocpage2_state.dart';

class Page2Bloc extends Bloc<page2Event, page2State> {
  final List<String> _dataList = [];

  Page2Bloc() : super(Page2Initial()) {
    on<AddData>((event, emit) async {
      if (event.data.isEmpty) {
        emit(Page2Error("Data cannot be empty"));
      } else {
        emit(Page2Loading(List.from(_dataList))); // Show the button loading state
        await Future.delayed(Duration(seconds: 2), () {
          _dataList.add(event.data);
          emit(Page2Loaded(List.from(_dataList))); // Final loaded state
        });
      }
    });
  }
}
