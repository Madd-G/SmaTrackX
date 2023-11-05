import 'package:SmaTrackX/core.dart';

class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({super.key});

  static const routeName = '/admin-home';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            AdminHomeHeader(),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.0),
                  Text('Attendance summary',
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.w500)),
                  SizedBox(height: 10.0),
                  // AdminSummaryCard(adminAttendanceSummary: [], index: 0,),
                  SizedBox(height: 25.0),
                  Text('Attendance History',
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.w500)),
                  SizedBox(height: 10.0),
                  AdminHistoryCard(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
