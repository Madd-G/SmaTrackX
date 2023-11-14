import 'package:SmaTrackX/core.dart';

class AttendancesScreen extends StatelessWidget {
  const AttendancesScreen({super.key});

  static const routeName = '/attendances';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              AttendancesHeader(),
              SizedBox(height: 15.0),
              SliderCategory(),
              SizedBox(height: 10.0),
              AttendancesCarousel(),
              AttendanceHistory(),
            ],
          ),
        ),
      ),
    );
  }
}
