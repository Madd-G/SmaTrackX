import 'package:SmaTrackX/core.dart';

class CategoryBox extends StatelessWidget {
  const CategoryBox({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {},
        child: RoundedContainer(
          containerColor: AppColors.secondaryColor,
          borderColor: AppColors.primaryColor,
          borderWidth: 1.5,
          radius: 10.0,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
            child: Center(
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w900,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
