part of 'tab_bloc.dart';

@immutable
abstract class TabEvent {}

@immutable
class TabEventWeek extends TabEvent {}

@immutable
class TabEventMonth extends TabEvent {}
