part of 'blocpage2_bloc.dart';

@immutable
sealed class page2State {}

class Page2Initial extends page2State {}

class Page2Loading extends page2State {
  final List<String> dataList;
  Page2Loading(this.dataList);
}

class Page2Loaded extends page2State {
  final List<String> dataList;
  Page2Loaded(this.dataList);
}

class Page2Error extends page2State {
  final String errorMessage;
  Page2Error(this.errorMessage);
}
