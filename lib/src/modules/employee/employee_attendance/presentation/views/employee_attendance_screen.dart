import 'package:smatrackx/core.dart';

class EmployeeAttendanceScreen extends StatelessWidget {
  const EmployeeAttendanceScreen({super.key});

  static const routeName = '/employee-attendance-screen';

  final String? photoUrl = '';

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) => CompanyBloc()
              ..add(LoadCompanyEvent(
                  companyId: context.currentUser!.companyId!))),
        BlocProvider(create: (_) => AttendanceBloc()),
        BlocProvider(create: (_) => DataBloc()..add(GetData())),
        BlocProvider(create: (_) => ClockBloc()),
      ],
      child: Scaffold(
        body: BlocBuilder<CompanyBloc, CompanyState>(
            builder: (context, companyState) {
          if (companyState is CompanyLoadedState) {
            return BlocBuilder<DataBloc, DataState>(
              builder: (BuildContext context, DataState state) {
                if (state is DataLoading) {
                  return Center(
                    child: Text(
                      "Get location...",
                      style: CustomTextStyle.textLargeSemiBold
                          .copyWith(color: AppColors.whiteColor),
                    ),
                  );
                } else if (state is DataLoaded) {
                  var position = state.position;
                  var deviceInfo = state.deviceInfo;
                  var destinationLatitude =
                      companyState.companyData["latitude"];
                  var destinationLongitude =
                      companyState.companyData["longitude"];
                  return BlocProvider(
                    create: (context) {
                      return MapCubit(
                        currentPosition:
                            LatLng(position.latitude, position.longitude),
                        destinationPosition:
                            LatLng(destinationLatitude, destinationLongitude),
                      );
                    },
                    child: Stack(
                      children: [
                        MapWidget(
                          position: position,
                          officePosition:
                              LatLng(destinationLatitude, destinationLongitude),
                        ),
                        AbsenceCard(
                          photoUrl: photoUrl!,
                          position: position,
                          deviceInfo: deviceInfo,
                        ),
                      ],
                    ),
                  );
                } else if (state is DataFailed) {
                  return const Center(
                    child: Text('Gagal mengambil data',
                        style: CustomTextStyle.textLargeSemiBold),
                  );
                } else {
                  return const Center(
                    child:
                        Text('Error', style: CustomTextStyle.textLargeSemiBold),
                  );
                }
              },
            );
          } else if (companyState is CompanyErrorState) {
            return Text("Error: ${companyState.errorMessage}");
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        }),
      ),
    );
  }
}
