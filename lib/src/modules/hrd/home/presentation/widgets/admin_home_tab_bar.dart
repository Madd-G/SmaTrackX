import 'package:SmaTrackX/core.dart';

class AdminHomeTabBar extends StatelessWidget {
  const AdminHomeTabBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // CategoryBox(text: 'Today'),
          // SizedBox(width: 10.0),
          // CategoryBox(text: 'This Week'),
        ],
      ),
    );
  }
}