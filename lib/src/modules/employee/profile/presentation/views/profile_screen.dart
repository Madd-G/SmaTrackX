import 'package:SmaTrackX/core.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  static const routeName = '/profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ProfileHeader(),
            if (context.currentUser!.isAdmin) const AdminDashboardButton(),
            const Menu(),
          ],
        ),
      ),
    );
  }
}


