import 'package:SmaTrackX/core.dart';

class AttendanceHistory extends StatelessWidget {
  const AttendanceHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: RoundedContainer(
        width: context.width,
        containerColor: Colors.white,
        borderColor: Colors.black12,
        child: const Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 15.0),
              AttendanceItem(
                status: 'Arrived on time',
                date: 'Wednesday, 8 January 2023',
                time: '07:20',
                // textColor: AppColors.greenColor,
              ),
              AttendanceItem(
                status: 'Arrived late',
                date: 'Wednesday, 9 January 2023',
                time: '08:12',
                // textColor: AppColors.yellowColor,
              ),
              AttendanceItem(
                status: 'No Show',
                date: 'Wednesday, 10 January 2023',
                time: '',
                // textColor: AppColors.redColor,
              ),
              AttendanceItem(
                status: 'Absent with permission',
                date: 'Wednesday, 11 January 2023',
                time: '',
                // textColor: AppColors.greenColor,
              ),
              AttendanceItem(
                status: 'Leave of absence',
                date: 'Wednesday, 12 January 2023',
                time: '',
                // textColor: AppColors.greenColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
