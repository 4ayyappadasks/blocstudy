import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutterblocstudey/bloclib5/domain/Enitity/userdetailsentity.dart';
import 'package:flutterblocstudey/bloclib5/domain/usecases/userdetilsusercases.dart';
import 'package:meta/meta.dart';

part 'userdetails_event.dart';

part 'userdetails_state.dart';

class UserdetailsBloc extends Bloc<UserdetailsEvent, UserdetailsState> {
  UserdetailsBloc() : super(UserdetailsInitial()) {
    on<FetchDetailsFromApiEvent>((event, emit) async{
      emit(UserdetailsInitial());
      print("blocApi of user details is waiting");
      emit(UserdetailsLoading());
      print("blocApi of user details is loading");
      try {
        final datas = await UserDetailsUseCases().GetdatafromDatasource();
        emit(UserdetailsLoaded(userdetailsEvent: datas));
      } catch (e) {
        emit(UserdetailsError(ermsg: e.toString()));
        throw Exception("error in blocApi ${e}");
      }
    });
  }
}
