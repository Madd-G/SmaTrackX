import 'package:smatrackx/core.dart';

part 'data_event.dart';

part 'data_state.dart';

class DataBloc extends Bloc<DataEvent, DataState> {
  DataBloc() : super(DataInitial()) {
    on<GetData>(
      (event, emit) async {
        try {
          emit(DataLoading());
          Position position = await getLocation();
          AndroidDeviceInfo deviceInfo = await getDeviceInfo();
          emit(DataLoaded(position: position, deviceInfo: deviceInfo));
        } catch (e) {
          emit(DataFailed());
        }
      },
    );
  }

  Future<AndroidDeviceInfo> getDeviceInfo() async {
    var deviceInfo = await DeviceService().getDeviceInfo();
    return deviceInfo;
  }

  Future<Position> getLocation() async {
    return await LocationService().getLocation();
  }
}
