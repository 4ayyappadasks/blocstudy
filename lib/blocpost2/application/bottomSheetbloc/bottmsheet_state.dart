part of 'bottmsheet_bloc.dart';

@immutable
sealed class BottmsheetState extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

final class BottmsheetInitial extends BottmsheetState {}
final class Bottmsheetshow extends BottmsheetState {}
final class Bottmsheetclose extends BottmsheetState {}
