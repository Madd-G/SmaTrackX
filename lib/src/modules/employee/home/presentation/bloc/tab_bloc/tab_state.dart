part of 'tab_bloc.dart';

@immutable
abstract class TabState {
  final int index;

  const TabState({required this.index});
}

@immutable
class TabStateInitial extends TabState {
  @override
  const TabStateInitial() : super(index: 0);
}

@immutable
class TabStateIsInWeek extends TabState {
  const TabStateIsInWeek(int idx) : super(index: 0);
}

@immutable
class TabStateIsInMonth extends TabState {
  const TabStateIsInMonth(int idx) : super(index: 1);
}
