import 'package:SmaTrackX/core.dart';

class EmployeeAttendanceScreen extends StatefulWidget {
  const EmployeeAttendanceScreen({super.key});

  static const routeName = '/employee-attendance-screen';

  @override
  State<EmployeeAttendanceScreen> createState() =>
      _EmployeeAttendanceScreenState();
}

class _EmployeeAttendanceScreenState extends State<EmployeeAttendanceScreen> {
  String? photoUrl = '';

  @override
  void initState() {
    context.read<DataBloc>().add(GetData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<DataBloc, DataState>(
        builder: (BuildContext context, DataState state) {
          if (state is DataLoading) {
            return const Center(
              child: Text(
                "Get location...",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            );
          } else if (state is DataLoaded) {
            var position = state.position;
            var deviceInfo = state.deviceInfo;
            return BlocProvider(
              create: (context) => MapCubit(
                currentPosition: LatLng(position.latitude, position.longitude),
                destinationPosition: const LatLng(-7.608132, 109.4675174),
              ),
              child: Stack(
                children: [
                  MapWidget(position: position),
                  AbsenceCard(
                    photoUrl: photoUrl!,
                    position: position,
                    deviceInfo: deviceInfo,
                  ),
                ],
              ),
            );
          } else if (state is DataFailed) {
            return const Center(
              child: Text('Gagal mengambil data'),
            );
          } else {
            return const Center(
              child: Text('Error'),
            );
          }
        },
      ),
    );
  }
}
