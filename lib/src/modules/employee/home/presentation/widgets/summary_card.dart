import 'package:SmaTrackX/core.dart';

class SummaryCard extends StatelessWidget {
  const SummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      width: context.width,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: DefaultTabController(
            initialIndex: 0,
            length: 2,
            child: SizedBox(
              height: 170,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Material(
                    color: Colors.white,
                    child: TabBar(
                      indicatorWeight: 0.0,
                      labelPadding: const EdgeInsets.all(0.0),
                      unselectedLabelColor: AppColors.greyColor,
                      indicator: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                          border: Border.all(
                            color: AppColors.primaryColor,
                            width: 1.5,
                          ),
                          color: AppColors.secondaryColor),
                      indicatorColor: AppColors.primaryColor,
                      labelColor: AppColors.primaryColor,
                      tabs: const [
                        HomeSummaryTabBar(text: 'This Week'),
                        HomeSummaryTabBar(text: 'This Month'),
                        // CategoryBox(text: 'This Month')
                      ],
                    ),
                  ),
                  const Flexible(
                    fit: FlexFit.loose,
                    child: TabBarView(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SummaryBox(count: 5, status: 'Arrive'),
                            SummaryBox(count: 1, status: 'Sick'),
                            SummaryBox(count: 1, status: 'Leave'),
                            SummaryBox(count: 0, status: 'Skip'),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SummaryBox(count: 25, status: 'Arrive'),
                            SummaryBox(count: 2, status: 'Sick'),
                            SummaryBox(count: 3, status: 'Leave'),
                            SummaryBox(count: 0, status: 'Skip'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class HomeSummaryTabBar extends StatelessWidget {
  const HomeSummaryTabBar({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}

class SummaryBox extends StatelessWidget {
  const SummaryBox({
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
