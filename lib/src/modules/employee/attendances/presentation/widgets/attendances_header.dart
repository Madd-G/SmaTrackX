import 'package:SmaTrackX/core.dart';

class AttendancesHeader extends StatelessWidget {
  const AttendancesHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(IconlyBold.user_2, color: AppColors.primaryColor),
          Text(
            'Friday, 10 February 2023',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 17.0,
              color: AppColors.blackColor,
            ),
          ),
          Icon(IconlyBold.notification, color: AppColors.blackColor),
        ],
      ),
    );
  }
}
