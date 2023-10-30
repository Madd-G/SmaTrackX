import 'package:SmaTrackX/core.dart';

class CheckInCard extends StatelessWidget {
  const CheckInCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const RoundedContainer(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Anonymous Company',
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text('08:00 - 17:00'),
                ],
              ),
            ),
            RoundedContainer(
              containerColor: AppColors.secondaryRedColor,
              borderColor: AppColors.redColor,
              radius: 10.0,
              child: Center(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                  child: Text(
                    'Check Out',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w700,
                      color: AppColors.redColor,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
