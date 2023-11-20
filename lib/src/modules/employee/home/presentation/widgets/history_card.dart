import 'package:SmaTrackX/core.dart';

class HistoryCard extends StatelessWidget {
  const HistoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const RoundedContainer(
      containerColor: Colors.white,
      borderColor: Colors.black12,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: AttendanceHistoryByWeek(),
      ),
    );
  }
}

class AttendanceHistoryByWeek extends StatelessWidget {
  const AttendanceHistoryByWeek({super.key});

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
          Map<String, dynamic>? data = snapshot.data?.data();

          if (data != null) {
            final sortedWeekRange = DateTime.now().getSortedWeekRange();

            final List<MapEntry<String, dynamic>> filteredData =
                data.entries.where((entry) {
              final checkInData = CheckInDataModel.fromFirestore(entry.value);
              final date = DateFormat('yyyy-MM-dd').parse(checkInData.date);
              return date.isAfter(sortedWeekRange[0]) &&
                  date.isBefore(sortedWeekRange[1]);
            }).toList();

            final List convertedData =
                filteredData.map((entry) => entry.value).toList();

            convertedData.sort((a, b) {
              final dateA = DateFormat('yyyy-MM-dd').parse(a['date']);
              final dateB = DateFormat('yyyy-MM-dd').parse(b['date']);
              return dateA.compareTo(dateB);
            });

            return ListView.builder(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: convertedData.length,
              itemBuilder: (context, index) {
                final entry = convertedData[index];
                final checkInData = CheckInDataModel.fromFirestore(entry);

                final checkInInfo = checkInData.checkInInfo;

                return AttendanceItem(
                  status: checkInInfo.status,
                  date: checkInData.date.dayDateMonthYear,
                  time: checkInInfo.time.hourMinute,
                );
              },
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

class AttendanceHistoryByMonth extends StatelessWidget {
  const AttendanceHistoryByMonth({Key? key}) : super(key: key);

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
            final thisMonthData = data.filterByMonth(11);
            return ListView.builder(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: thisMonthData.length,
              itemBuilder: (context, index) {
                final entry = thisMonthData[index];
                final checkInData = CheckInDataModel.fromFirestore(entry.value);
                return AttendanceItem(
                  status: checkInData.checkInInfo.status,
                  date: checkInData.date.dayDateMonthYear,
                  time: checkInData.checkInInfo.time.hourMinute,
                );
              },
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

class AttendanceHistoryAll extends StatelessWidget {
  const AttendanceHistoryAll({super.key});

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
            return ListView.builder(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: data.length,
              itemBuilder: (context, index) {
                final date = data.keys.elementAt(index);
                final checkInData = CheckInDataModel.fromFirestore(data[date]);
                return AttendanceItem(
                  status: checkInData.checkInInfo.status,
                  date: checkInData.date.dayDateMonthYear,
                  time: checkInData.checkInInfo.time.hourMinute,
                );
              },
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

class HomeHistoryTabBar extends StatelessWidget {
  const HomeHistoryTabBar({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
      child: Center(
        child: Text(
          text,
          style: CustomTextStyle.textLargeBold
              .copyWith(fontWeight: FontWeight.w900),
        ),
      ),
    );
  }
}

class AttendanceItem extends StatelessWidget {
  const AttendanceItem({
    super.key,
    required this.status,
    required this.date,
    required this.time,
  });

  final String status;
  final String date;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: RoundedContainer(
        width: context.width,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                status,
                style: CustomTextStyle.textLargeBold.copyWith(
                  color: (status == 'Arrived on time'
                      ? AppColors.greenColor
                      : (status == 'Arrived late'
                          ? AppColors.yellowColor
                          : AppColors.redColor)),
                ),
              ),
              Text(
                '$date - $time',
                style: CustomTextStyle.textBold
                    .copyWith(color: const Color(0xFF9AA3AF)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
