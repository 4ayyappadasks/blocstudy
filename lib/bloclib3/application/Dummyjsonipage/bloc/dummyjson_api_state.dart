part of 'dummyjson_api_bloc.dart';

@immutable
sealed class DummyjsonApiState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class DummyjsonApiInitial extends DummyjsonApiState {}

final class DummyjsonApiLoading extends DummyjsonApiState {}

final class DummyjsonApiLoaded extends DummyjsonApiState {
  final List<DatumEntity> data;

  DummyjsonApiLoaded({required this.data});

  @override
  List<Object?> get props => [data];
}

final class DummyjsonApiError extends DummyjsonApiState {
  final String errormsg;

  DummyjsonApiError({required this.errormsg});

  @override
  List<Object?> get props => [errormsg];
}
