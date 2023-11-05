import 'package:SmaTrackX/core.dart';

class AdminSummaryCard extends StatelessWidget {
  const AdminSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      width: context.width,
      child: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 10.0),
            AdminHomeTabBar(),
            SizedBox(height: 10.0),
            // AdminSummaryTabBody(adminAttendanceSummary: adminAttendanceSummary),
            SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }
}

// class AdminSummaryTabBody extends StatelessWidget {
//   const AdminSummaryTabBody({
//     super.key,
//     required this.adminAttendanceSummary,
//   });
//
//   final List<AdminAttendanceSummary> adminAttendanceSummary;
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: adminAttendanceSummary.map((e) {
//           return AdminSummaryTile(
//             adminAttendanceSummary: e,
//             onTap: () {},
//           );
//         }).toList());
//   }
// }

class AdminSummaryTile extends StatelessWidget {
  const AdminSummaryTile({
    super.key,
    this.onTap,
  });

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: RoundedContainer(
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
                1.toString(),
                style: const TextStyle(
                  fontSize: 26.0,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF4D4B51),
                ),
              ),
              const Text(
                'On Time',
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF9AA3AF),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
