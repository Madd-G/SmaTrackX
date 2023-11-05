import 'package:SmaTrackX/core.dart';

class CheckInCard extends StatelessWidget {
  const CheckInCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Anonymous Company',
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                      '${context.currentUser?.workStart?.displayTime} - ${context.currentUser?.workEnd?.displayTime}'),
                ],
              ),
            ),
            StreamBuilder<QuerySnapshot>(
              stream: AttendanceService().attendanceSnapshot(),
              builder: (context, snapshot) {
                if (snapshot.hasError) return const Text("Error");
                if (snapshot.data == null) return Container();
                final data = snapshot.data!;
                bool isNotCheckInToday = snapshot.data!.docs.isEmpty;

                if (isNotCheckInToday) {
                  return const CheckInButton();
                }

                var attendanceToday =
                    data.docs.last.data() as Map<String, dynamic>;
                bool isCheckoutToday = attendanceToday["checkout"] == true;

                if (isCheckoutToday) {
                  return const CompletedButton();
                }

                return const CheckOutButton();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CheckOutButton extends StatelessWidget {
  const CheckOutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, EmployeeAttendanceScreen.routeName);
      },
      child: const RoundedContainer(
        containerColor: AppColors.redSecondaryColor,
        borderColor: AppColors.redColor,
        radius: 10.0,
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
            child: Text(
              'Check Out',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w700,
                color: AppColors.redColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CompletedButton extends StatelessWidget {
  const CompletedButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        CoreUtils.showSnackBar(context,
            'Your attendance for today has been successfully recorded.');
      },
      child: const RoundedContainer(
        containerColor: AppColors.secondaryColor,
        borderColor: AppColors.blackColor,
        radius: 10.0,
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
            child: Text(
              'Completed',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w700,
                color: AppColors.blackColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CheckInButton extends StatelessWidget {
  const CheckInButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, EmployeeAttendanceScreen.routeName);
      },
      child: const RoundedContainer(
        containerColor: AppColors.greenSecondaryColor,
        borderColor: AppColors.greenColor,
        radius: 10.0,
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
            child: Text(
              'Check In',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w700,
                color: AppColors.greenColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
