import 'package:SmaTrackX/core.dart';

class AdminDashboardButton extends StatelessWidget {
  const AdminDashboardButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, top: 16.0, right: 16.0),
      child: RoundedContainer(
        containerColor: AppColors.greenColor,
        borderColor: AppColors.greenColor,
        radius: 10.0,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(
                    context, AdminBottomNavigation.routeName);
              },
              child: const Text(
                'Admin Dashboard',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
