import 'package:SmaTrackX/core.dart';

class AttendancesHeader extends StatelessWidget {
  const AttendancesHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
              onTap: () {
                context.currentUser!.isAdmin
                    ? Navigator.pushReplacementNamed(
                        context, AdminBottomNavigation.routeName)
                    : null;
              },
              child:
                  const Icon(IconlyBold.user_2, color: AppColors.primaryColor)),
          const Text(
            'Friday, 10 February 2023',
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 17.0,
                color: AppColors.blackColor,
                fontFamily: Fonts.aeonik),
          ),
          const Icon(IconlyBold.notification, color: AppColors.blackColor),
        ],
      ),
    );
  }
}
