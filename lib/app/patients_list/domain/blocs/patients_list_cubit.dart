import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teste_tecnico_anlix/app/patients_list/data/repositories/patients_list_repository.dart';
import 'package:teste_tecnico_anlix/app/patients_list/domain/entities/patient.dart';

class PatientsListCubit extends Cubit<PatientsListState> {
  final PatientsListRepository _repository;

  PatientsListCubit(this._repository) : super(PatientsListInitial());

  Future<void> fetchFileContent(String fileName) async {
    emit(PatientsListLoading());
    try {
      final content = await _repository.getFileContent(fileName);
      emit(PatientsListLoaded(Patient.fromJsonList(jsonDecode(content))));
    } catch (e) {
      emit(PatientsListError(e.toString()));
    }
  }

  // Método para obter um paciente pelo índice
  Patient? getPatientByIndex(int index) {
    if (state is PatientsListLoaded) {
      return (state as PatientsListLoaded).files[index];
    }
    return null;
  }

  // Método para obter uma característica específica de um paciente pelo índice
  String? getPatientCharacteristicByIndex(int index, String characteristic) {
    final patient = getPatientByIndex(index);
    if (patient != null) {
      switch (characteristic) {
        case 'name':
          return patient.name;
        case 'age':
          return patient.age.toString();
        case 'cpf':
          return patient.cpf;
        case 'rg':
          return patient.rg;
        case 'birthDate':
          return patient.birthDate;
        case 'gender':
          return patient.gender;
        case 'zodiacSign':
          return patient.zodiacSign;
        case 'motherName':
          return patient.motherName;
        case 'fatherName':
          return patient.fatherName;
        case 'email':
          return patient.email;
        case 'cep':
          return patient.cep;
        case 'address':
          return patient.address;
        case 'houseNumber':
          return patient.houseNumber.toString();
        case 'neighborhood':
          return patient.neighborhood;
        case 'city':
          return patient.city;
        case 'state':
          return patient.state;
        case 'landlinePhone':
          return patient.landlinePhone;
        case 'mobilePhone':
          return patient.mobilePhone;
        case 'height':
          return patient.height;
        case 'weight':
          return patient.weight.toString();
        case 'bloodType':
          return patient.bloodType;
        case 'color':
          return patient.color;
        default:
          return null;
      }
    }
    return null;
  }

  // Método para obter todas as características de um paciente pelo índice
  Patient? getAllCharacteristicsForPatient(int index) {
    return getPatientByIndex(index);
  }
}

abstract class PatientsListState {}

class PatientsListInitial extends PatientsListState {}

class PatientsListLoading extends PatientsListState {}

class PatientsListLoaded extends PatientsListState {
  final List<Patient> files;

  PatientsListLoaded(this.files);
}

class PatientsListError extends PatientsListState {
  final String message;

  PatientsListError(this.message);
}
