import 'package:flutter/material.dart';

class GenderFilterDialog extends StatelessWidget {
  final VoidCallback onMaleSelected;
  final VoidCallback onFemaleSelected;

  const GenderFilterDialog({
    required this.onMaleSelected,
    required this.onFemaleSelected,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Filtrar por sexo'),
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
      children: <Widget>[
        ListTile(
          leading: const Icon(Icons.male),
          title: const Text('Masculino'),
          onTap: onMaleSelected,
        ),
        ListTile(
          leading: const Icon(Icons.female),
          title: const Text('Feminino'),
          onTap: onFemaleSelected,
        ),
      ],
    );
  }
}
