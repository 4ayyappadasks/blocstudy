part of 'mock_api_bloc.dart';

@immutable
sealed class MockApiState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class MockApiInitial extends MockApiState {}

final class MockApiLoading extends MockApiState {}

final class MockApiLoaded extends MockApiState {
  MockApiLoaded({required this.data});
  final List<MockApiEnities> data;
  @override
  List<Object?> get probs => [];
}

final class MockApierror extends MockApiState {
  MockApierror({required this.errormsg});

  final String errormsg;

  @override
  List<Object?> get probs => [];
}
