import 'package:smatrackx/core.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      decoration: const BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 10.0),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(IconlyBold.user_2, color: AppColors.whiteColor),
                  Text(
                    DateTime.now().toDayDateMonthYear(),
                    style: CustomTextStyle.textLargeMedium
                        .copyWith(color: AppColors.whiteColor),
                  ),
                  const Icon(IconlyBold.notification,
                      color: AppColors.whiteColor),
                ],
              ),
              const SizedBox(height: 30.0),
              const ProfileCard(),
              const SizedBox(height: 5.0),
            ],
          ),
        ),
      ),
    );
  }
}
