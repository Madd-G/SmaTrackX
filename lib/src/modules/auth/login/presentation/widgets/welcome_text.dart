import 'package:SmaTrackX/core.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({
    required this.title,
    required this.subtitle,
    super.key,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontFamily: Fonts.aeonik,
            fontWeight: FontWeight.w900,
            fontSize: 36,
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Text(
          subtitle,
          style: const TextStyle(fontSize: 14),
        ),
      ],
    );
  }
}
