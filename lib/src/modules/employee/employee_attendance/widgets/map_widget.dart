import 'package:SmaTrackX/core.dart';

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
  @override
  void initState() {
    BlocProvider.of<MapCubit>(context).drawPolyline();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapCubit, MapState>(
      builder: (context, state) {
        try {
          if (state is MapPolylineDrawnState) {
            return Maps(
              position:
                  LatLng(widget.position.latitude, widget.position.longitude),
              polylinePoints: state.polylinePoints,
              totalDistance: state.totalDistance,
              totalTime: state.totalTime,
            );
          }
        } catch (e) {
          return const Center(child: Text('An error occurred.'));
        }

        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}

class Maps extends StatelessWidget {
  final LatLng position;
  final Set<Polyline> polylinePoints;
  final String totalDistance;
  final String totalTime;

  const Maps({
    Key? key,
    required this.position,
    required this.polylinePoints,
    required this.totalDistance,
    required this.totalTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CameraPosition initialPosition = CameraPosition(
      target: LatLng(position.latitude, position.longitude),
      zoom: 20,
    );

    BitmapDescriptor destinationIcon = BitmapDescriptor.defaultMarker;
    BitmapDescriptor sourceIcon =
        BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue);

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
              // googleMapController = controller;
            },
            markers: {
              Marker(
                markerId: const MarkerId("source"),
                icon: sourceIcon,
                position: LatLng(position.latitude, position.longitude),
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
}
