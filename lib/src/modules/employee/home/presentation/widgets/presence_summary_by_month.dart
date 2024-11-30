import 'package:smatrackx/core.dart';

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
          final Map<String, dynamic>? data = snapshot.data?.data();
          if (data != null) {
            List<MapEntry<String, dynamic>> thisMonthData =
            data.filterByMonth(month);
            final statusCounts = data.monthCountStatus(thisMonthData);

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
