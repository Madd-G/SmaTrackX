part of 'map_cubit.dart';

@immutable
abstract class MapState {}

class MapInitialState extends MapState {}

class MapPolylineDrawnState extends MapState {
  final String totalDistance;
  final String totalTime;
  final Set<Polyline> polylinePoints;

  MapPolylineDrawnState({
    required this.totalDistance,
    required this.totalTime,
    required this.polylinePoints,
  });
}


