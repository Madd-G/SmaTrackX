import 'package:smatrackx/core.dart';

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
