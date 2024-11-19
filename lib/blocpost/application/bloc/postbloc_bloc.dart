import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutterblocstudey/bloclib5/domain/usecases/userdetilsusercases.dart';
import 'package:flutterblocstudey/blocpost/domain/Entity/postblocentity.dart';
import 'package:flutterblocstudey/blocpost/domain/UseCases/postblocusecases.dart';
import 'package:meta/meta.dart';

part 'postbloc_event.dart';
part 'postbloc_state.dart';

class PostblocBloc extends Bloc<PostblocEvent, PostblocState> {
  final int id;
  PostblocBloc({required this.id}) : super(PostblocInitial()) {
    on<PostblocApicallEvent>((event, emit) async {
      emit(PostblocInitial());
      print("Bloc is waiting with id: $id");
      emit(Postblocloading());
      print("Bloc is loading");
      try {
        final data = await PostblocUseCases(id: id).getdatafromDatasource();
        emit(Postblocloaded(postblocEntity: data));
        print("Bloc loaded successfully");
      } catch (e) {
        print("Bloc error: $e");
        emit(Postblocerror(errmsg: e.toString()));
      }
    });
  }
}

