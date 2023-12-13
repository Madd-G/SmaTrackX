import 'package:smatrackx/core.dart';

part 'map_state.dart';

class MapCubit extends Cubit<MapState> {
  final LatLng currentPosition;
  final LatLng destinationPosition;
  String totalDistance = "";
  String totalTime = "";

  PolylineResponse polylineResponse = PolylineResponse();

  MapCubit({
    required this.currentPosition,
    required this.destinationPosition,
    // required this.officePosition,
  }) : super(MapInitialState());

  double get distance {
    return totalDistance.extractNumber();
  }

  Dio dio = Dio();

  void drawPolyline() async {
    try {
      Response response = await dio.post(
        "https://maps.googleapis.com/maps/api/directions/json",
        queryParameters: {
          'key': 'AIzaSyCdrEFiuZccbqDqVcHndteT_RkypJLZCDs',
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

      Set<Polyline> polyline = {};

      for (int i = 0;
          i < polylineResponse.routes![0].legs![0].steps!.length;
          i++) {
        polyline.add(Polyline(
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
            color: AppColors.greenColor));
      }

      emit(MapPolylineDrawnState(
        totalDistance: totalDistance,
        totalTime: totalTime,
        polylinePoints: polyline,
      ));
    } catch (e) {
      debugPrint('Error drawing polyline: $e');
      // Handle error as needed
    }
  }
}
