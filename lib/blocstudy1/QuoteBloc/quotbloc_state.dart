part of 'quotbloc_bloc.dart';

@immutable
sealed class QuotblocState {}

final class QuotblocInitial extends QuotblocState {}

class QuoteLoading extends QuotblocState {}

class QuoteLoaded extends QuotblocState {
  QuoteLoaded({required this.msg});
  final String msg;
}

class QuotError extends QuotblocState {
  QuotError({required this.errormsg});
  final String errormsg;
}