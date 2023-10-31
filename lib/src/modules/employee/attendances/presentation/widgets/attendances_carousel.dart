import 'package:SmaTrackX/core.dart';

class AttendancesCarousel extends StatelessWidget {
  const AttendancesCarousel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, top: 16.0, bottom: 16.0),
      child: SizedBox(
        height: 190.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: const [
            AttendanceCard(
              text: 'Arrived on time',
              icon: Icons.check_box,
              number: 23,
              iconColor: AppColors.greenColor,
              iconBackgroundColor: AppColors.greenSecondaryColor,
              iconBorderColor: AppColors.greenColor,
            ),
            AttendanceCard(
              text: 'Arrived late',
              icon: Icons.warning_rounded,
              number: 2,
              iconColor: AppColors.yellowColor,
              iconBackgroundColor: AppColors.yellowSecondaryColor,
              iconBorderColor: AppColors.yellowColor,
            ),
            AttendanceCard(
              text: 'No show',
              icon: Icons.block,
              number: 0,
              iconColor: AppColors.redColor,
              iconBackgroundColor: AppColors.redSecondaryColor,
              iconBorderColor: AppColors.redColor,
            ),
          ],
        ),
      ),
    );
  }
}

class AttendanceCard extends StatelessWidget {
  const AttendanceCard({
    super.key,
    required this.icon,
    required this.text,
    required this.number,
    required this.iconColor,
    required this.iconBackgroundColor,
    required this.iconBorderColor,
  });

  final String text;
  final int number;
  final IconData icon;
  final Color iconColor;
  final Color iconBackgroundColor;
  final Color iconBorderColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: RoundedContainer(
        width: 150.0,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RoundedContainer(
                height: 50.0,
                width: 50.0,
                containerColor: iconBackgroundColor,
                borderColor: iconBorderColor,
                radius: 10.0,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Icon(icon, color: iconColor),
                  ),
                ),
              ),
              Text(
                text,
                style: const TextStyle(
                    fontSize: 16.0,
                    color: AppColors.textColor,
                    fontWeight: FontWeight.w700),
              ),
              Text(
                '$number',
                style: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w900,
                  color: Colors.black,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
