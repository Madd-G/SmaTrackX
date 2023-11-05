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
                const SizedBox(height: 15.0,),
                const Expanded(
                  child: TabBarView(
                    children: [
                      Column(
                        children: [
                          AttendanceItem(
                            status: 'Arrived on time',
                            date: 'Wednesday, 8 January 2023',
                            time: '07:20',
                          ),
                          AttendanceItem(
                            status: 'Arrived late',
                            date: 'Wednesday, 9 January 2023',
                            time: '08:12',
                          ),
                          AttendanceItem(
                            status: 'No Show',
                            date: 'Wednesday, 10 January 2023',
                            time: '',
                          ),
                          AttendanceItem(
                            status: 'Absent with permission',
                            date: 'Wednesday, 11 January 2023',
                            time: '',
                          ),
                          AttendanceItem(
                            status: 'Leave of absence',
                            date: 'Wednesday, 12 January 2023',
                            time: '',
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          AttendanceItem(
                            status: 'Arrived on time',
                            date: 'Wednesday, 1 January 2023',
                            time: '07:20',
                          ),
                          AttendanceItem(
                            status: 'Arrived late',
                            date: 'Wednesday, 2 January 2023',
                            time: '08:12',
                          ),
                          AttendanceItem(
                            status: 'No Show',
                            date: 'Wednesday, 3 January 2023',
                            time: '',
                          ),
                          AttendanceItem(
                            status: 'Absent with permission',
                            date: 'Wednesday, 4 January 2023',
                            time: '',
                          ),
                          AttendanceItem(
                            status: 'Leave of absence',
                            date: 'Wednesday, 5 January 2023',
                            time: '',
                          ),
                        ],
                      ),
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
