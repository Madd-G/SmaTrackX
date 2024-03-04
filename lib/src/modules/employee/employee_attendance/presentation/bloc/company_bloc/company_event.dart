part of 'company_bloc.dart';

@immutable
abstract class CompanyEvent {}

class LoadCompanyEvent extends CompanyEvent {
  final String companyId;
  LoadCompanyEvent({required this.companyId});
}

class UpdateCompanyEvent extends CompanyEvent {
  final String companyName;
  final String address;
  final double latitude;
  final double longitude;

  UpdateCompanyEvent({
    required this.companyName,
    required this.address,
    required this.latitude,
    required this.longitude,
  });
}

class UpdateLocationEvent extends CompanyEvent {
  final double latitude;
  final double longitude;

  UpdateLocationEvent({
    required this.latitude,
    required this.longitude,
  });
}
