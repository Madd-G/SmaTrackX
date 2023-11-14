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
                  Text(
                    'Anonymous Company',
                    maxLines: 2,
                    style: CustomTextStyle.textLargeMedium.copyWith(
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Consumer<UserProvider>(builder: (_, provider, __) {
                    final user = provider.user;
                    return Text(
                      '${user?.workStart?.displayTime} - ${user?.workEnd?.displayTime}',
                      style: CustomTextStyle.textMediumMedium,
                    );
                  }),
                ],
              ),
            ),
            StreamBuilder<DocumentSnapshot>(
              stream: AttendanceService().attendanceSnapshot(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Text("Error",
                      style: CustomTextStyle.textBigMedium);
                }
                if (snapshot.data == null) return Container();
                final data = snapshot.data?.data() as Map<String, dynamic>;
                var dateKey = DateTime.now().yearMonthDay();
                bool isNotCheckInToday = !data.containsKey(dateKey);

                if (isNotCheckInToday) {
                  return const CheckInButton();
                }
                var isCheckoutToday =
                    data[DateTime.now().yearMonthDay()]['isCheckedOut'] == true;

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
      child: RoundedContainer(
        containerColor: AppColors.redSecondaryColor,
        borderColor: AppColors.redColor,
        radius: 10.0,
        child: Center(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
            child: Text('Check Out',
                style: CustomTextStyle.textLargeBold
                    .copyWith(color: AppColors.redColor)),
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
        CoreUtils.showSnackBar(
          context,
          'Your attendance for today has been successfully recorded.',
        );
      },
      child: RoundedContainer(
        containerColor: AppColors.secondaryColor,
        borderColor: AppColors.blackColor,
        radius: 10.0,
        child: Center(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
            child: Text(
              'Completed',
              style: CustomTextStyle.textLargeBold
                  .copyWith(color: AppColors.blackColor),
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
      child: RoundedContainer(
        containerColor: AppColors.greenSecondaryColor,
        borderColor: AppColors.greenColor,
        radius: 10.0,
        child: Center(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
            child: Text(
              'Check In',
              style: CustomTextStyle.textLargeBold
                  .copyWith(color: AppColors.greenColor),
            ),
          ),
        ),
      ),
    );
  }
}
