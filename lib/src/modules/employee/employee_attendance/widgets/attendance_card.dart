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
      left: 20,
      right: 20,
      bottom: 20,
      child: Card(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                deviceInfo.model,
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Divider(),
              Row(
                children: [
                  SizedBox(
                    height: 120.0,
                    width: 120.0,
                    child: QSquareImagePicker(
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          context.currentUser!.fullName,
                          style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              DateTime.now().dateFormat,
                              style: const TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            BlocBuilder<ClockBloc, ClockState>(
                              builder: (context, state) {
                                String time = state.time.clockFormat;
                                return Text(
                                  time,
                                  style: const TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w500),
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
              StreamBuilder<QuerySnapshot>(
                stream: AttendanceService().attendanceSnapshot(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Text("Error");
                  }
                  if (snapshot.data == null) return Container();
                  bool isNotCheckInToday = snapshot.data!.docs.isEmpty;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          (photoUrl == '')
                              ? () {}
                              : context.read<AttendanceBloc>().add(
                                    CheckInEvent(
                                      photoUrl: photoUrl,
                                      position: position,
                                      deviceModel: deviceInfo.model,
                                      currentDate: DateTime.now().dateFormat,
                                      time: DateTime.now().clockFormat,
                                      deviceId: deviceInfo.id,
                                    ),
                                  );
                        },
                        child: RoundedContainer(
                          width: context.width,
                          containerColor: isNotCheckInToday
                              ? AppColors.greenColor
                              : Colors.grey,
                          borderColor: isNotCheckInToday
                              ? AppColors.greenColor
                              : Colors.grey,
                          borderWidth: 3,
                          radius: 10.0,
                          child: const Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 8.0),
                              child: Text(
                                'Check In',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w700,
                                ),
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
                          (photoUrl == '')
                              ? () {}
                              : context.read<AttendanceBloc>().add(
                                    CheckOutEvent(
                                      photoUrl: photoUrl,
                                      position: position,
                                      deviceModel: deviceInfo.model,
                                      currentDate: DateTime.now().dateFormat,
                                      time: DateTime.now().clockFormat,
                                      deviceId: deviceInfo.id,
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
                          child: const Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 8.0),
                              child: Text(
                                'Check Out',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w700,
                                ),
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
