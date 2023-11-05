import 'package:SmaTrackX/core.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
  });

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
                  GestureDetector(
                      onTap: () {
                        context.currentUser!.isAdmin
                            ? Navigator.pushReplacementNamed(
                                context, AdminBottomNavigation.routeName)
                            : null;
                      },
                      child:
                          const Icon(IconlyBold.user_2, color: Colors.white)),
                  const Text(
                    'Profile',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 17.0,
                        color: Colors.white,
                        fontFamily: Fonts.aeonik),
                  ),
                  const Icon(IconlyBold.notification, color: Colors.white),
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
