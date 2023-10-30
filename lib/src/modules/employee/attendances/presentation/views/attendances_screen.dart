import 'package:SmaTrackX/core.dart';

class AttendancesScreen extends StatelessWidget {
  const AttendancesScreen({super.key});

  static const routeName = '/attendances';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Attendances Screen'),
      ),
    );
  }
}
