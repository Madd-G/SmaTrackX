import 'package:SmaTrackX/core.dart';

class AttendanceHistory extends StatelessWidget {
  const AttendanceHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Attendance History',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500)),
          SizedBox(height: 10.0),
          AttendancesCard(),
        ],
      ),
    );
  }
}

class AttendancesCard extends StatelessWidget {
  const AttendancesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(20.0),
        ),
        border: Border.all(color: Colors.black12),
      ),
      child: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 10.0),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // CategoryBox(text: 'This Day'),
                  // SizedBox(width: 10.0),
                  // CategoryBox(text: 'This Week'),
                ],
              ),
            ),
            SizedBox(height: 15.0),
            AttendancesItem(
              status: 'Arrived on time',
              date: 'Wednesday, 8 January 2023',
              time: '07:20',
              textColor: AppColors.greenColor,
            ),
            AttendancesItem(
              status: 'Arrived late',
              date: 'Wednesday, 9 January 2023',
              time: '08:12',
              textColor: AppColors.yellowColor,
            ),
            AttendancesItem(
              status: 'No Show',
              date: 'Wednesday, 10 January 2023',
              time: '',
              textColor: AppColors.redColor,
            ),
            AttendancesItem(
              status: 'Absent with permission',
              date: 'Wednesday, 11 January 2023',
              time: '',
              textColor: AppColors.greenColor,
            ),
            AttendancesItem(
              status: 'Leave of absence',
              date: 'Wednesday, 12 January 2023',
              time: '',
              textColor: AppColors.greenColor,
            ),
          ],
        ),
      ),
    );
  }
}

class AttendancesItem extends StatelessWidget {
  const AttendancesItem({
    super.key,
    required this.status,
    required this.date,
    required this.time,
    required this.textColor,
  });

  final String status;
  final String date;
  final String time;
  final Color textColor;

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
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w700,
                    color: textColor),
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
