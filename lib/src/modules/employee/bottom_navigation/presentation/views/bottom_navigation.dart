import 'package:SmaTrackX/core.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  static const routeName = '/bottom_navigation';

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UserModel>(
      stream: UserUtils.userDataStream,
      builder: (_, snapshot) {
        if (snapshot.hasData && snapshot.data is UserModel) {
          context.read<UserProvider>().user = snapshot.data;
        }
        return Consumer<BottomNavController>(
          builder: (context, controller, __) {
            return Scaffold(
              body: IndexedStack(
                index: controller.currentIndex,
                children: controller.screens,
              ),
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: controller.currentIndex,
                showSelectedLabels: false,
                backgroundColor: Colors.white,
                elevation: 8,
                onTap: controller.changeIndex,
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(
                      controller.currentIndex == 0
                          ? IconlyBold.home
                          : IconlyLight.home,
                      color: controller.currentIndex == 0
                          ? AppColors.primaryColor
                          : Colors.grey,
                    ),
                    label: 'Home',
                    backgroundColor: Colors.white,
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      controller.currentIndex == 1
                          ? IconlyBold.chart
                          : IconlyLight.chart,
                      color: controller.currentIndex == 1
                          ? AppColors.primaryColor
                          : Colors.grey,
                    ),
                    label: 'Attendances',
                    backgroundColor: Colors.white,
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      controller.currentIndex == 2
                          ? IconlyBold.chat
                          : IconlyLight.chat,
                      color: controller.currentIndex == 2
                          ? AppColors.primaryColor
                          : Colors.grey,
                    ),
                    label: 'Chat',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      controller.currentIndex == 3
                          ? IconlyBold.profile
                          : IconlyLight.profile,
                      color: controller.currentIndex == 3
                          ? AppColors.primaryColor
                          : Colors.grey,
                    ),
                    label: 'Profile',
                    backgroundColor: Colors.white,
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
