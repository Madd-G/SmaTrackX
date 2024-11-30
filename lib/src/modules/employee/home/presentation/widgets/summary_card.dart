import 'package:smatrackx/core.dart';

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
                    color: AppColors.whiteColor,
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
                      ],
                    ),
                  ),
                  const Flexible(
                    fit: FlexFit.loose,
                    child: TabBarView(
                      children: [
                        PresenceSummaryByWeek(),
                        PresenceSummaryByMonth(),
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


