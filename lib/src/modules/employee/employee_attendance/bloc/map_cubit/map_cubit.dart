import 'package:SmaTrackX/core.dart';

part 'map_state.dart';

class MapCubit extends Cubit<MapState> {
  final LatLng currentPosition;
  final LatLng destinationPosition;
  LatLng dummy = const LatLng(-7.4302759, 109.2344236);
  String totalDistance = "";
  String totalTime = "";

  PolylineResponse polylineResponse = PolylineResponse();

  MapCubit({
    required this.currentPosition,
    required this.destinationPosition,
  }) : super(MapInitialState());

  Dio dio = Dio();

  void drawPolyline() async {
    try {
      Response response = await dio.post(
        "https://maps.googleapis.com/maps/api/directions/json",
        queryParameters: {
          'key': 'AIzaSyDrV8msUDn9Gy6RJuJvV47kURIgmUdsDe4',
          'units': 'metric',
          'origin': '${currentPosition.latitude},${currentPosition.longitude}',
          'destination':
              '${destinationPosition.latitude},${destinationPosition.longitude}',
          'mode': 'driving',
        },
      );

      polylineResponse = PolylineResponse.fromJson(response.data);

      totalDistance = polylineResponse.routes![0].legs![0].distance!.text!;
      totalTime = polylineResponse.routes![0].legs![0].duration!.text!;

      Set<Polyline> polylines = {};

      for (int i = 0;
          i < polylineResponse.routes![0].legs![0].steps!.length;
          i++) {
        polylines.add(Polyline(
            polylineId: PolylineId(polylineResponse
                .routes![0].legs![0].steps![i].polyline!.points!),
            points: [
              LatLng(
                  polylineResponse
                      .routes![0].legs![0].steps![i].startLocation!.lat!,
                  polylineResponse
                      .routes![0].legs![0].steps![i].startLocation!.lng!),
              LatLng(
                  polylineResponse
                      .routes![0].legs![0].steps![i].endLocation!.lat!,
                  polylineResponse
                      .routes![0].legs![0].steps![i].endLocation!.lng!),
            ],
            width: 5,
            color: Colors.green));
      }

      emit(MapPolylineDrawnState(
        totalDistance: totalDistance,
        totalTime: totalTime,
        polylinePoints: polylines,
      ));
    } catch (e) {
      debugPrint('Error drawing polyline: $e');
      // Handle error as needed
    }
  }
}
