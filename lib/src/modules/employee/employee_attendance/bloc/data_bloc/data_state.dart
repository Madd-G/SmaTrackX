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
  final AndroidDeviceInfo deviceInfo;

  DataLoaded({required this.position, required this.deviceInfo});
}

@immutable
class DataFailed extends DataState {}
