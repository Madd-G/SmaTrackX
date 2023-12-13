import 'package:smatrackx/core.dart';

class NotFoundText extends StatelessWidget {
  const NotFoundText(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: context.theme.textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.greyColor.withOpacity(.5),
          ),
        ),
      ),
    );
  }
}
