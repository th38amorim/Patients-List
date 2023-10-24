import 'package:patients_list/app/patients_list/domain/entities/patient.dart';

abstract class PatientsListState {}

class PatientsListInitial extends PatientsListState {}

class PatientsListLoading extends PatientsListState {}

class PatientsListLoaded extends PatientsListState {
  final List<Patient> patients;

  PatientsListLoaded(this.patients);
}

class PatientsListError extends PatientsListState {
  final String message;

  PatientsListError(this.message);
}