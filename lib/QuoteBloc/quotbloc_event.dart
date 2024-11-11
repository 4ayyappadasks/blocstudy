part of 'quotbloc_bloc.dart';

@immutable
sealed class QuotblocEvent {}

class RequestQuote extends QuotblocEvent {}
