import 'package:smatrackx/core.dart';

class SummaryBox extends StatelessWidget {
  const SummaryBox({super.key, required this.count, required this.status});

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
              style: CustomTextStyle.textLargeBold
                  .copyWith(color: const Color(0xFF4D4B51), fontSize: 26.0),
            ),
            Text(
              status,
              style: CustomTextStyle.textMediumBold
                  .copyWith(color: const Color(0xFF9AA3AF)),
            ),
          ],
        ),
      ),
    );
  }
}
