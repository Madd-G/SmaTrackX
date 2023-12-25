part of 'data_bloc.dart';

@immutable
abstract class DataState {}

@immutable
class DataInitial extends DataState {}

@immutable
class DataLoading extends DataState {}

@immutable
class DataLoaded extends DataState {
  final Position position;
  final dynamic deviceInfo;

  DataLoaded({required this.position, required this.deviceInfo});
}

@immutable
class DataFailed extends DataState {
  final String errorMessage;

  DataFailed(this.errorMessage);
}
