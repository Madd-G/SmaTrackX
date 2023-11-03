import 'package:SmaTrackX/core.dart';

class AdminSummaryCard extends StatelessWidget {
  const AdminSummaryCard({
    super.key,
  });

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
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CategoryBox(text: 'Today', isSelected: true),
                  SizedBox(width: 10.0),
                  CategoryBox(text: 'This Week', isSelected: false),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AdminSummaryBox(count: 25, status: 'On time'),
                AdminSummaryBox(count: 2, status: 'Late'),
                AdminSummaryBox(count: 3, status: 'leave'),
                AdminSummaryBox(count: 0, status: 'No show'),
              ],
            ),
            SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}

class AdminSummaryBox extends StatelessWidget {
  const AdminSummaryBox({
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
              style: const TextStyle(
                fontSize: 26.0,
                fontWeight: FontWeight.w700,
                color: Color(0xFF4D4B51),
              ),
            ),
            Text(
              status,
              style: const TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w700,
                color: Color(0xFF9AA3AF),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
