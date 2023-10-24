import 'package:flutter/material.dart';

class FilterDialog extends StatelessWidget {
  final String? selectedGender;
  final VoidCallback onGenderFilterClick;

  const FilterDialog({
    required this.selectedGender,
    required this.onGenderFilterClick,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      title: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Filtros'),
          CloseButton(),
        ],
      ),
      children: <Widget>[
        ListTile(
          leading: const Icon(Icons.people),
          title: const Text('Filtrar por sexo'),
          subtitle: selectedGender != null
              ? Text('Selecionado: $selectedGender')
              : null,
          onTap: () {
            Navigator.pop(context);
            onGenderFilterClick();
          },
        ),
      ],
    );
  }
}