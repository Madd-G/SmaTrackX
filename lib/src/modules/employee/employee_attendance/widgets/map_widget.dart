import 'package:SmaTrackX/core.dart';
import 'package:http/http.dart' as http;

class MapWidget extends StatefulWidget {
  const MapWidget({
    super.key,
    required this.position,
  });

  final Position position;

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  LatLng dummy = const LatLng(-7.4302759, 109.2344236);

  @override
  void initState() {
    drawPolyline(LatLng(widget.position.latitude, widget.position.longitude),
        const LatLng(-7.608132, 109.4675174));
    // drawPolyline(dummy, const LatLng(-7.608132, 109.4675174));
    super.initState();
  }

  PolylineResponse polylineResponse = PolylineResponse();
  GoogleMapController? googleMapController;
  String totalDistance = "";
  String totalTime = "";
  BitmapDescriptor destinationIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor sourceIcon =
      BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue);
  String apiKey = "AIzaSyDrV8msUDn9Gy6RJuJvV47kURIgmUdsDe4";
  Set<Polyline> polylinePoints = {};

  @override
  Widget build(BuildContext context) {
    CameraPosition initialPosition = CameraPosition(
        target: LatLng(widget.position.latitude, widget.position.longitude),
        zoom: 20);
    return Positioned(
      left: 0,
      right: 0,
      top: 0,
      bottom: 0,
      child: Stack(
        children: [
          GoogleMap(
            polylines: polylinePoints,
            zoomControlsEnabled: true,
            initialCameraPosition: initialPosition,
            mapType: MapType.hybrid,
            onMapCreated: (GoogleMapController controller) {
              googleMapController = controller;
            },
            markers: {
              Marker(
                markerId: const MarkerId("source"),
                icon: sourceIcon,
                position:
                    LatLng(widget.position.latitude, widget.position.longitude),
                // position: dummy,
              ),
              Marker(
                  markerId: const MarkerId("destination"),
                  icon: destinationIcon,
                  position: const LatLng(-7.608132, 109.4675174)),
            },
          ),
          SafeArea(
            child: Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(20),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Total Distance: $totalDistance"),
                  Text("Total Time: $totalTime"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void drawPolyline(LatLng origin, LatLng destination) async {
    var response = await http.post(Uri.parse(
        "https://maps.googleapis.com/maps/api/directions/json?key=$apiKey&units=metric&origin=${origin.latitude},${origin.longitude}&destination=${destination.latitude},${destination.longitude}&mode=driving"));

    polylineResponse = PolylineResponse.fromJson(jsonDecode(response.body));

    totalDistance = polylineResponse.routes![0].legs![0].distance!.text!;
    totalTime = polylineResponse.routes![0].legs![0].duration!.text!;

    for (int i = 0;
        i < polylineResponse.routes![0].legs![0].steps!.length;
        i++) {
      polylinePoints.add(Polyline(
          polylineId: PolylineId(
              polylineResponse.routes![0].legs![0].steps![i].polyline!.points!),
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

    setState(() {});
  }
}
