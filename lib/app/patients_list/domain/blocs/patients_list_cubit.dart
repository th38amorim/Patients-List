import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teste_tecnico_anlix/app/patients_list/data/repositories/patients_list_repository.dart';
import 'package:teste_tecnico_anlix/app/patients_list/domain/blocs/patients_list_state.dart';
import 'package:teste_tecnico_anlix/app/patients_list/domain/entities/patient.dart';

class PatientsListCubit extends Cubit<PatientsListState> {
  final PatientsListRepository _repository;

  PatientsListCubit(this._repository) : super(PatientsListInitial());

  Future<void> fetchFileContent() async {
    emit(PatientsListLoading());
    try {
      final content = await _repository.getFileContent();
      emit(PatientsListLoaded(Patient.fromMapList(jsonDecode(content))));
    } catch (e) {
      emit(PatientsListError(e.toString()));
    }
  }
}
