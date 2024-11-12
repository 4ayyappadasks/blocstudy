import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutterblocstudey/bloclib/data/model/post_model.dart';
import 'package:flutterblocstudey/bloclib/domin/entities/post_entity.dart';
import 'package:flutterblocstudey/bloclib/domin/usecases/post_usecases.dart';
import 'package:meta/meta.dart';

import '../../../../sample_post.dart';

part 'postloadbloc_event.dart';

part 'postloadbloc_state.dart';

class PostloadblocBloc extends Bloc<PostloadblocEvent, PostloadblocState> {
  PostloadblocBloc() : super(PostloadblocInitial()) {
    on<PostloadedEvent>((event, emit) async {
      print("bloc initialized");
      try {
        final post = await PostUseCases().GetPOstFromDataSources();
        emit(Postloaded(post: post));
      } catch (e) {
        emit(Postloaderror(errormsg: "${e}"));
        throw Exception("${e}");
      }
    });
  }
}
