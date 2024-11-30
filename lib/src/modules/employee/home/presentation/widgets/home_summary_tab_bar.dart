import 'package:smatrackx/core.dart';

class HomeSummaryTabBar extends StatelessWidget {
  const HomeSummaryTabBar({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
      child: Center(
        child: Text(
          text,
          style: CustomTextStyle.textLargeBold,
        ),
      ),
    );
  }
}
