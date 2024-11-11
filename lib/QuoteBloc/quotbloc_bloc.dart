import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'quotbloc_event.dart';

part 'quotbloc_state.dart';

class QuotblocBloc extends Bloc<QuotblocEvent, QuotblocState> {
  QuotblocBloc() : super(QuotblocInitial()) {
    on<RequestQuote>((event, emit) async {
      emit(QuoteLoading());
      print("bloc is initially triggered");
      await Future.delayed(
        Duration(seconds: 3),
        () {
          emit(QuoteLoaded(msg: "The Quote is always Good"));
        },
      );
      print("quote is loaded");
      // emit(QuotError(errormsg: "Error in loading quote"));
      // print("error in quote loading");
    });
  }
}
