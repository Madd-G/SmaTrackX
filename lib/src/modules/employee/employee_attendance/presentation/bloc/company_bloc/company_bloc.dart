import 'package:SmaTrackX/core.dart';

part 'company_event.dart';

part 'company_state.dart';

class CompanyBloc extends Bloc<CompanyEvent, CompanyState> {
  CompanyBloc() : super(CompanyInitialState()) {
    on<LoadCompanyEvent>(_onLoadCompanyEvent);
    on<UpdateCompanyEvent>(_onUpdateCompanyEvent);
    on<UpdateLocationEvent>(_onUpdateLocationEvent);
  }

  void _onLoadCompanyEvent(
    LoadCompanyEvent event,
    Emitter<CompanyState> emit,
  ) async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection("office")
          .snapshots()
          .first;

      if (snapshot.docs.isNotEmpty) {
        final currentData = snapshot.docs.first.data();
        emit(CompanyLoadedState(companyData: currentData));
      } else {
        emit(CompanyLoadedState(companyData: const {}));
      }
    } catch (e) {
      emit(CompanyErrorState(errorMessage: 'Error loading company data'));
    }
  }

  void _onUpdateCompanyEvent(
    UpdateCompanyEvent event,
    Emitter<CompanyState> emit,
  ) async {
    try {
      await FirebaseFirestore.instance
          .collection("office")
          .doc("main-company")
          .set({
        "company_name": event.companyName,
        "address": event.address,
        "latitude": event.latitude,
        "longitude": event.longitude,
      });

      emit(CompanyLoadedState(companyData: {
        "company_name": event.companyName,
        "address": event.address,
        "latitude": event.latitude,
        "longitude": event.longitude,
      }));
    } catch (e) {
      emit(CompanyErrorState(errorMessage: 'Error updating company data'));
    }
  }

  void _onUpdateLocationEvent(
    UpdateLocationEvent event,
    Emitter<CompanyState> emit,
  ) async {
    try {
      await FirebaseFirestore.instance
          .collection("office")
          .doc("main-company")
          .update({
        "latitude": event.latitude,
        "longitude": event.longitude,
      });

      emit(LocationUpdatedState(
        latitude: event.latitude,
        longitude: event.longitude,
      ));
    } catch (e) {
      emit(CompanyErrorState(errorMessage: 'Error updating location'));
    }
  }
}
