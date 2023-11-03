import 'package:SmaTrackX/core.dart';

class MapWidget extends StatelessWidget {
  const MapWidget({
    super.key,
    required this.position,
  });

  final Position position;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      top: 0,
      bottom: 0,
      child: Builder(
        builder: (context) {
          List<Marker> allMarkers = [
            Marker(
              point: LatLng(
                position.latitude,
                position.longitude,
              ),
              builder: (context) => const Icon(
                Icons.pin_drop,
                color: Colors.red,
                size: 24,
              ),
            ),
          ];
          return SizedBox(
            height: context.height * 0.4,
            child: FlutterMap(
              options: MapOptions(
                center: LatLng(
                  position.latitude,
                  position.longitude,
                ),
                zoom: 16,
                interactiveFlags:
                InteractiveFlag.all - InteractiveFlag.rotate,
              ),
              children: [
                TileLayer(
                  urlTemplate:
                  'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName:
                  'dev.fleaflet.flutter_map.example',
                ),
                MarkerLayer(
                  markers: allMarkers,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
