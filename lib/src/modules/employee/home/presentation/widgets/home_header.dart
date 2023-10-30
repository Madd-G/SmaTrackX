import 'package:SmaTrackX/core.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          IconlyBold.user_2,
          color: Colors.white,
        ),
        Text(
          'Friday, 10 February 2023',
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 17.0,
              color: Colors.white,
              fontFamily: Fonts.aeonik),
        ),
        Icon(
          IconlyBold.notification,
          color: Colors.white,
        ),
      ],
    );
  }
}
