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
      child: const SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(height: 10.0),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(IconlyBold.user_2, color: Colors.white),
                  Text(
                    'Profile',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 17.0,
                        color: Colors.white),
                  ),
                  Icon(IconlyBold.notification, color: Colors.white),
                ],
              ),
              SizedBox(height: 30.0),
              ProfileCard(),
              SizedBox(height: 5.0),
            ],
          ),
        ),
      ),
    );
  }
}
