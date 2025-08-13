import 'package:flutter/material.dart';

class CustomChoiceChip extends StatelessWidget {
  final String label;
  final bool selected;
  final ValueChanged<bool>? onSelected;
  final bool disabled;

  const CustomChoiceChip(
      {super.key, required this.label, required this.selected, this.onSelected, this.disabled = false});

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      selectedColor: Theme.of(context).colorScheme.primary,
      label: Text(label),
      labelStyle: selected ? TextStyle(color: Colors.white) : const TextStyle(color: Colors.black),
      selected: selected,
      onSelected: disabled ? null : onSelected,
      disabledColor: disabled ? Colors.grey : null,
      showCheckmark: false,
    );
  }
}