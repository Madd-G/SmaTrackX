import 'package:SmaTrackX/core.dart';

class SliderCategory extends StatelessWidget {
  const SliderCategory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: SizedBox(
        height: 45.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: const [
            SliderItem(isSelected: false, text: 'This Day'),
            SliderItem(isSelected: false, text: 'This Week'),
            SliderItem(isSelected: true, text: 'This Month'),
            SliderItem(isSelected: false, text: 'This Year'),
            SliderItem(isSelected: false, text: 'Full Employment'),
          ],
        ),
      ),
    );
  }
}

class SliderItem extends StatelessWidget {
  const SliderItem({
    super.key,
    required this.isSelected,
    required this.text,
  });

  final bool isSelected;
  final String text;

  @override
  Widget build(BuildContext context) {
    return isSelected
        ? Padding(
            padding: const EdgeInsets.only(right: 30.0),
            child: RoundedContainer(
              containerColor: AppColors.secondaryColor,
              borderColor: AppColors.primaryColor,
              borderWidth: 2.0,
              radius: 10.0,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 0.0),
                  child: Text(
                    text,
                    style: CustomTextStyle.textLargeBold
                        .copyWith(color: AppColors.primaryColor),
                  ),
                ),
              ),
            ),
          )
        : Padding(
            padding: const EdgeInsets.only(right: 30.0),
            child: RoundedContainer(
              containerColor: AppColors.backgroundColor,
              borderColor: AppColors.backgroundColor,
              borderWidth: 2.0,
              radius: 10.0,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 0.0),
                  child: Text(
                    text,
                    style: CustomTextStyle.textLargeBold
                        .copyWith(color: AppColors.textColor),
                  ),
                ),
              ),
            ),
          );
  }
}
