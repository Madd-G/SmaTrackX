import 'package:SmaTrackX/core.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            HomeHeader(),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.0),
                  CheckInCard(),
                  SizedBox(height: 25.0),
                  Text('Your Presence in Summary',
                      style: CustomTextStyle.textLargeSemiBold),
                  SizedBox(height: 10.0),
                  SummaryCard(),
                  SizedBox(height: 25.0),
                  Text('Attendance History',
                      style: CustomTextStyle.textLargeSemiBold),
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
