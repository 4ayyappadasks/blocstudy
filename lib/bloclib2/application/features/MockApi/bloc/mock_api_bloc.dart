import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutterblocstudey/bloclib2/domain/enitities/MockApi_enitities.dart';
import 'package:flutterblocstudey/bloclib2/domain/usercases/MockApi_userCases.dart';
import 'package:meta/meta.dart';

part 'mock_api_event.dart';

part 'mock_api_state.dart';

class MockApiBloc extends Bloc<MockApiEvent, MockApiState> {
  MockApiBloc() : super(MockApiInitial()) {
    on<LoadMockApiEvent1>((event, emit) async {
      log("Dummyjsonipage is initialized");
      emit(MockApiLoading());
      print("data is loading");
      try {
        final MockApidata = await MockApilUseCases().GetPostFromDataSource();
        emit(MockApiLoaded(data: MockApidata));
      } catch (e) {
        emit(MockApierror(errormsg: "${e}"));
        throw Exception("error in Dummyjsonipage : ${e}");
      }
    });
  }
}
