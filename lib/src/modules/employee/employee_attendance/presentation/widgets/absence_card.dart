import 'package:SmaTrackX/core.dart';

// ignore: must_be_immutable
class AbsenceCard extends StatelessWidget {
  AbsenceCard({
    super.key,
    required this.photoUrl,
    required this.position,
    required this.deviceInfo,
  });

  String photoUrl;
  final Position position;
  final AndroidDeviceInfo deviceInfo;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 10,
      right: 10,
      bottom: 25,
      child: Card(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(deviceInfo.model,
                  style:
                      CustomTextStyle.textLargeBold.copyWith(fontSize: 17.5)),
              const Divider(),
              Row(
                children: [
                  SizedBox(
                    height: context.width * 0.35,
                    width: context.width * 0.35,
                    child: SquareImagePicker(
                      label: "Photo",
                      hint: "Your photo",
                      validator: Validator.required,
                      value: null,
                      onChanged: (value) {
                        photoUrl = value;
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 12.0,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(context.currentUser!.fullName,
                            style: CustomTextStyle.textLargeBold
                                .copyWith(fontSize: 17.5)),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 10.0,
                            ),
                            Text(DateTime.now().dateFormat,
                                style: CustomTextStyle.textBigSemiBold),
                            BlocBuilder<ClockBloc, ClockState>(
                              builder: (context, state) {
                                String time = state.time.clockFormat;
                                return Text(
                                  time,
                                  style: CustomTextStyle.textLargeSemiBold
                                      .copyWith(fontSize: 27.0),
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              StreamBuilder<DocumentSnapshot>(
                stream: AttendanceService().attendanceSnapshot(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Text("Error",
                        style: CustomTextStyle.textLargeMedium);
                  }
                  if (snapshot.data == null) return Container();
                  final data = snapshot.data?.data() as Map<String, dynamic>;
                  bool isCheckInToday =
                      data.containsKey(DateTime.now().yearMonthDay());

                  bool isNotCheckInToday =
                      !data.containsKey(DateTime.now().yearMonthDay());

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          (photoUrl == '' || isCheckInToday)
                              ? () {}
                              : context.read<AttendanceBloc>().add(
                                    CheckInEvent(
                                      photoUrl: photoUrl,
                                      position: position,
                                      deviceModel: deviceInfo.model,
                                      currentDate: DateTime.now().dateFormat,
                                      time: DateTime.now().clockFormat,
                                      deviceId: deviceInfo.id,
                                      checkInOrder: 1,
                                      // TODO: real status
                                      status: 'Arrived on time',
                                      distance:
                                          BlocProvider.of<MapCubit>(context)
                                              .distance,
                                    ),
                                  );
                        },
                        child: RoundedContainer(
                          width: context.width,
                          containerColor: isCheckInToday
                              ? Colors.grey
                              : AppColors.greenColor,
                          borderColor: isCheckInToday
                              ? Colors.grey
                              : AppColors.greenColor,
                          borderWidth: 3,
                          radius: 10.0,
                          child: Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Text(
                                'Check In',
                                style: CustomTextStyle.textBigBold
                                    .copyWith(fontSize: 20.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      GestureDetector(
                        onTap: () {
                          (photoUrl == '' || isNotCheckInToday)
                              ? () {}
                              : context.read<AttendanceBloc>().add(
                                    CheckOutEvent(
                                      photoUrl: photoUrl,
                                      position: position,
                                      deviceModel: deviceInfo.model,
                                      currentDate: DateTime.now().dateFormat,
                                      time: DateTime.now().clockFormat,
                                      deviceId: deviceInfo.id,
                                      // TODO: real distance
                                      checkOutOrder: 10,
                                      status: 'Arrived on time',
                                      distance:
                                          BlocProvider.of<MapCubit>(context)
                                              .distance,
                                    ),
                                  );
                        },
                        child: RoundedContainer(
                          width: context.width,
                          containerColor: isNotCheckInToday
                              ? Colors.grey
                              : AppColors.redColor,
                          borderColor: isNotCheckInToday
                              ? Colors.grey
                              : AppColors.redColor,
                          borderWidth: 3,
                          radius: 10.0,
                          child: Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Text(
                                'Check Out',
                                style: CustomTextStyle.textBigBold
                                    .copyWith(fontSize: 20.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
