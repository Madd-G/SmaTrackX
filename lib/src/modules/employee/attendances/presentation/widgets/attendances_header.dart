import 'package:smatrackx/core.dart';

class AttendancesHeader extends StatelessWidget {
  const AttendancesHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(IconlyBold.user_2, color: AppColors.primaryColor),
          Text(
            DateTime.now().toDayDateMonthYear(),
            style: CustomTextStyle.textLargeBold
                .copyWith(color: AppColors.blackColor),
          ),
          const Icon(IconlyBold.notification, color: AppColors.blackColor),
        ],
      ),
    );
  }
}
