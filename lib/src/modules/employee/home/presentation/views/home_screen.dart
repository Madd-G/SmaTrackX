import 'package:SmaTrackX/core.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: context.width,
              decoration: const BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                ),
              ),
              child: const SafeArea(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      SizedBox(height: 10.0),
                      HomeHeader(),
                      SizedBox(height: 30.0),
                      ProfileCard(),
                      SizedBox(height: 5.0),
                    ],
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.0),
                  CheckInCard(),
                  SizedBox(height: 25.0),
                  Text('Your Presence in Summary',
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.w500)),
                  SizedBox(height: 10.0),
                  SummaryCard(),
                  SizedBox(height: 25.0),
                  Text('Attendance History',
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.w500)),
                  SizedBox(height: 10.0),
                  HistoryCard(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
