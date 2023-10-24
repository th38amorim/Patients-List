import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teste_tecnico_anlix/app/patients_list/domain/blocs/patients_list_cubit.dart';
import 'package:teste_tecnico_anlix/app/patients_list/domain/blocs/patients_list_state.dart';
import 'package:teste_tecnico_anlix/app/patients_list/domain/entities/patient.dart';
import 'package:teste_tecnico_anlix/app/patients_list/presentation/widgets/filter_dialog.dart';
import 'package:teste_tecnico_anlix/app/patients_list/presentation/widgets/gender_filter_dialog.dart';

class PatientListScreen extends StatefulWidget {
  const PatientListScreen({Key? key}) : super(key: key);

  @override
  State<PatientListScreen> createState() => _PatientListScreenState();
}

class _PatientListScreenState extends State<PatientListScreen> {
  String? _selectedGender;

  @override
  void initState() {
    super.initState();
    context.read<PatientsListCubit>().fetchFileContent();
  }

  void _clearFilter() => setState(() => _selectedGender = null);

  void _setGenderFilter(String gender) =>
      setState(() => _selectedGender = gender);

  void _showFilterPopup() {
    showDialog(
      context: context,
      builder: (context) => FilterDialog(
        selectedGender: _selectedGender,
        onGenderFilterClick: _showGenderFilter,
      ),
    );
  }

  void _showGenderFilter() {
    showDialog(
      context: context,
      builder: (context) => GenderFilterDialog(
        onMaleSelected: () {
          _setGenderFilter('Masculino');
          Navigator.pop(context);
        },
        onFemaleSelected: () {
          _setGenderFilter('Feminino');
          Navigator.pop(context);
        },
      ),
    );
  }

  void _showAllCharacteristics(Patient patient) {
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: Center(child: Text(patient.name)),
        children: patient.toMap().entries.map((e) {
          return ListTile(title: Text('${e.key}: ${e.value.toString()}'));
        }).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pacientes'),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: _showFilterPopup,
            tooltip: 'Filtrar por sexo',
          ),
          if (_selectedGender != null)
            IconButton(
              icon: const Icon(Icons.clear),
              onPressed: _clearFilter,
            ),
        ],
      ),
      body: BlocBuilder<PatientsListCubit, PatientsListState>(
        builder: (context, state) {
          if (state is PatientsListLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is PatientsListLoaded) {
            final patients = state.patients.where((patient) {
              return _selectedGender == null ||
                  patient.gender == _selectedGender;
            }).toList();

            return ListView.builder(
              itemCount: patients.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(
                  patients[index].name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(patients[index].email),
                onTap: () => _showAllCharacteristics(patients[index]),
                tileColor: Colors.deepPurple.withOpacity(0.05),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
            );
          } else if (state is PatientsListError) {
            debugPrint(state.message);
            return Center(child: Text(state.message));
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
