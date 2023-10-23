import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:teste_tecnico_anlix/app/patients_list/domain/blocs/patients_list_cubit.dart';
import 'package:teste_tecnico_anlix/app/patients_list/domain/entities/patient.dart';

class PatientListScreen extends StatefulWidget {
  const PatientListScreen({super.key});

  @override
  State<PatientListScreen> createState() => _PatientListScreenState();
}

class _PatientListScreenState extends State<PatientListScreen> {
  @override
  void initState() {
    super.initState();
    context.read<PatientsListCubit>().fetchFileContent('pacientes.json');
  }

  void _showAllCharacteristics(Patient patient) {
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: Center(child: Text(patient.name)),
        children: patient.toMap().entries.map((e) {
          return ListTile(
            title: Text('${e.key}: ${e.value.toString()}'),
          );
        }).toList(),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );

    if (selectedDate != null) {
      String formattedDate = DateFormat('dd/MM/yyyy').format(selectedDate);
      scaffoldMessenger.showSnackBar(
        SnackBar(content: Text('Data selecionada: $formattedDate')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Patients'),
        actions: [
          IconButton(
            icon: const Icon(Icons.date_range),
            onPressed: () => _selectDate(context),
          ),
        ],
      ),
      body: BlocBuilder<PatientsListCubit, PatientsListState>(
        builder: (context, state) {
          if (state is PatientsListLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is PatientsListLoaded) {
            return ListView.builder(
              itemCount: state.files.length,
              itemBuilder: (context, index) {
                final patient = state.files[index];
                return ListTile(
                  title: Text(patient.name,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text(patient.email),
                  onTap: () => _showAllCharacteristics(patient),
                  tileColor: Colors.deepPurple.withOpacity(0.05),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                );
              },
            );
          } else {
            return const Offstage();
          }
        },
      ),
    );
  }
}

extension on Patient {
  Map<String, dynamic> toMap() {
    return {
      'Nome': name,
      'Idade': age,
      'CPF': cpf,
      'RG': rg,
      'Data de nascimento': birthDate,
      'Gênero': gender,
      'Signo do zodíaco': zodiacSign,
      'Nome da mãe': motherName,
      'Nome do pai': fatherName,
      'Email': email,
      'CEP': cep,
      'Endereço': address,
      'Número da casa': houseNumber,
      'Bairro': neighborhood,
      'Cidade': city,
      'Estado': state,
      'Telefone fixo': landlinePhone,
      'Celular': mobilePhone,
      'Altura': height,
      'Peso': '$weight kg',
      'Tipo sanguíneo': bloodType,
      'Cor': color,
    };
  }
}
