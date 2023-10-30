import 'package:SmaTrackX/core.dart';

class CategoryBox extends StatelessWidget {
  const CategoryBox({super.key, required this.text, required this.isSelected});

  final String text;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: isSelected
          ? Container(
              decoration: BoxDecoration(
                color: AppColors.secondaryColor,
                border: Border.all(color: AppColors.primaryColor, width: 1.5),
                borderRadius: const BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 12.0),
                child: Center(
                  child: Text(
                    text,
                    style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w900,
                        color: AppColors.primaryColor),
                  ),
                ),
              ),
            )
          : Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.white, width: 1.5),
                borderRadius: const BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 12.0),
                child: Center(
                  child: Text(
                    text,
                    style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w900,
                        color: AppColors.primaryColor),
                  ),
                ),
              ),
            ),
    );
  }
}
