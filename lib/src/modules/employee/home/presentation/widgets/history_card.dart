import 'package:SmaTrackX/core.dart';

class HistoryCard extends StatelessWidget {
  const HistoryCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      width: context.width,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: DefaultTabController(
          initialIndex: 0,
          length: 2,
          child: SizedBox(
            height: 550.0,
            child: Column(
              children: [
                Material(
                  color: Colors.white,
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
                      HomeHistoryTabBar(text: 'This Week'),
                      HomeHistoryTabBar(text: 'This Month'),
                    ],
                  ),
                ),
                const Expanded(
                  child: TabBarView(
                    children: [
                      AttendanceHistoryByWeek(),
                      AttendanceHistoryByMonth(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AttendanceHistoryAll extends StatelessWidget {
  const AttendanceHistoryAll({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
      stream: HomeService().attendanceHistorySnapshot(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.hasData) {
          final data = snapshot.data?.data();
          if (data != null) {
            return ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: data.length,
              itemBuilder: (context, index) {
                final date = data.keys.elementAt(index);
                final checkInData = CheckInData.fromMap(data[date]);

                return AttendanceItem(
                  status: checkInData.checkInInfo.status,
                  date: checkInData.date.dayDateMonthYear,
                  time: checkInData.checkInInfo.time.hourMinute,
                );
              },
            );
          } else {
            return const Center(child: Text('Data not found.'));
          }
        } else {
          return const Center(child: Text('Document not found.'));
        }
      },
    );
  }
}

class AttendanceHistoryByMonth extends StatelessWidget {
  const AttendanceHistoryByMonth({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
      stream: HomeService().attendanceHistorySnapshot(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.hasData) {
          final data = snapshot.data?.data();
          if (data != null) {
            final thisMonthData = data.filterByMonth(11);
            return ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: thisMonthData.length,
              itemBuilder: (context, index) {
                final entry = thisMonthData[index];
                final checkInData = CheckInData.fromMap(entry.value);
                return AttendanceItem(
                  status: checkInData.checkInInfo.status,
                  date: checkInData.date.dayDateMonthYear,
                  time: checkInData.checkInInfo.time.hourMinute,
                );
              },
            );
          } else {
            return const Center(child: Text('Data not found.'));
          }
        } else {
          return const Center(child: Text('Document not found.'));
        }
      },
    );
  }
}

class AttendanceHistoryByWeek extends StatelessWidget {
  const AttendanceHistoryByWeek({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
      stream: HomeService().attendanceHistorySnapshot(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.hasData) {
          final data = snapshot.data?.data();
          if (data != null) {
            final List<DateTime> currentWeekRange =
                DateTime.now().getCurrentWeekRange();
            final List<MapEntry<String, dynamic>> filteredData =
                data.entries.where((entry) {
              final CheckInData checkInData = CheckInData.fromMap(entry.value);
              final DateTime date = DateTime.parse(checkInData.date);
              return date.isAfter(currentWeekRange[0]) &&
                  date.isBefore(currentWeekRange[1]);
            }).toList();

            return ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: filteredData.length,
              itemBuilder: (context, index) {
                final entry = filteredData[index];
                final checkInData = CheckInData.fromMap(entry.value);

                final checkInInfo = checkInData.checkInInfo;

                return AttendanceItem(
                  status: checkInInfo.status,
                  date: checkInData.date.dayDateMonthYear,
                  time: checkInInfo.time.hourMinute,
                );
              },
            );
          } else {
            return const Center(child: Text('Data not found.'));
          }
        } else {
          return const Center(child: Text('Document not found.'));
        }
      },
    );
  }
}

class HomeHistoryTabBar extends StatelessWidget {
  const HomeHistoryTabBar({
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
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w900,
          ),
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
                style: const TextStyle(
                    fontSize: 16.0, fontWeight: FontWeight.w700),
              ),
              Text(
                '$date - $time',
                style: const TextStyle(
                    color: Color(0xFF9AA3AF), fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
