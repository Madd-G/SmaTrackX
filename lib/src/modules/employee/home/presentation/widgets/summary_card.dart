import 'package:smatrackx/core.dart';

class SummaryCard extends StatelessWidget {
  const SummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      width: context.width,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: DefaultTabController(
            initialIndex: 0,
            length: 2,
            child: SizedBox(
              height: 170,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Material(
                    color: AppColors.whiteColor,
                    child: TabBar(
                      indicatorWeight: 0.0,
                      labelPadding: const EdgeInsets.all(0.0),
                      unselectedLabelColor: AppColors.greyColor,
                      indicator: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                          border: Border.all(
                            color: AppColors.primaryColor,
                            width: 1.5,
                          ),
                          color: AppColors.secondaryColor),
                      indicatorColor: AppColors.primaryColor,
                      labelColor: AppColors.primaryColor,
                      tabs: const [
                        HomeSummaryTabBar(text: 'This Week'),
                        HomeSummaryTabBar(text: 'This Month'),
                      ],
                    ),
                  ),
                  const Flexible(
                    fit: FlexFit.loose,
                    child: TabBarView(
                      children: [
                        PresenceSummaryByWeek(),
                        PresenceSummaryByMonth(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class PresenceSummaryByWeek extends StatelessWidget {
  const PresenceSummaryByWeek({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        stream: GetAttendanceHistory(sl<AttendanceRepository>())
            .call(context.currentUser!.uid),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}',
                style: CustomTextStyle.textBigRegular);
          } else if (snapshot.hasData) {
            final data = snapshot.data?.data();
            if (data != null) {
              final currentWeekRange = DateTime.now().getCurrentWeekRange();
              final List<MapEntry<String, dynamic>> filteredData =
                  data.entries.where((entry) {
                final checkInData = CheckInDataModel.fromFirestore(entry.value);
                final date = DateFormat('yyyy-MM-dd').parse(checkInData.date);
                return date.isAfter(currentWeekRange[0]) &&
                    date.isBefore(currentWeekRange[1]);
              }).toList();

              final List<Map<String, dynamic>> convertedData = filteredData
                  .map((entry) => entry.value as Map<String, dynamic>)
                  .toList();

              final statusCounts = convertedData.weekCountStatus();

              int arriveCount = statusCounts['arriveCount'] ?? 0;
              int leaveCount = statusCounts['leaveCount'] ?? 0;
              int absenceCount = statusCounts['absenceCount'] ?? 0;

              return Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SummaryBox(count: filteredData.length, status: 'Days'),
                  SummaryBox(count: arriveCount, status: 'Arrived'),
                  SummaryBox(count: leaveCount, status: 'Leave'),
                  SummaryBox(count: absenceCount, status: 'Absence'),
                ],
              );
            } else {
              return const Center(
                  child: Text('Data not found.',
                      style: CustomTextStyle.textBigRegular));
            }
          } else {
            return const Center(
                child: Text('Document not found.',
                    style: CustomTextStyle.textBigRegular));
          }
        });
  }
}

class PresenceSummaryByMonth extends StatelessWidget {
  const PresenceSummaryByMonth({super.key});

  @override
  Widget build(BuildContext context) {
    final int month = DateTime.now().month;
    return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
      stream: GetAttendanceHistory(sl<AttendanceRepository>())
          .call(context.currentUser!.uid),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}',
              style: CustomTextStyle.textBigRegular);
        } else if (snapshot.hasData) {
          final data = snapshot.data?.data();
          if (data != null) {
            final thisMonthData = data.filterByMonth(month);
            final statusCounts = data.monthCountStatus();

            int arriveCount = statusCounts['arriveCount'] ?? 0;
            int leaveCount = statusCounts['leaveCount'] ?? 0;
            int absenceCount = statusCounts['absenceCount'] ?? 0;

            return Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SummaryBox(count: thisMonthData.length, status: 'Days'),
                SummaryBox(count: arriveCount, status: 'Arrived'),
                SummaryBox(count: leaveCount, status: 'Leave'),
                SummaryBox(count: absenceCount, status: 'Absence'),
              ],
            );
          } else {
            return const Center(
                child: Text('Data not found.',
                    style: CustomTextStyle.textBigRegular));
          }
        } else {
          return const Center(
              child: Text('Document not found.',
                  style: CustomTextStyle.textBigRegular));
        }
      },
    );
  }
}

class HomeSummaryTabBar extends StatelessWidget {
  const HomeSummaryTabBar({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
      child: Center(
        child: Text(
          text,
          style: CustomTextStyle.textLargeBold,
        ),
      ),
    );
  }
}

class SummaryBox extends StatelessWidget {
  const SummaryBox({
    super.key,
    required this.count,
    required this.status,
  });

  final int count;
  final String status;

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      height: context.width / 5.2,
      width: context.width / 5.2,
      containerColor: const Color(0xFFEFF2F7),
      borderColor: const Color(0xFFEFF2F7),
      radius: 10.0,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              count.toString(),
              style: CustomTextStyle.textLargeBold
                  .copyWith(color: const Color(0xFF4D4B51), fontSize: 26.0),
            ),
            Text(
              status,
              style: CustomTextStyle.textMediumBold
                  .copyWith(color: const Color(0xFF9AA3AF)),
            ),
          ],
        ),
      ),
    );
  }
}
