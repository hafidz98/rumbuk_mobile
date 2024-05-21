import 'package:flutter/material.dart';

class CustomChoiceChip extends StatelessWidget {
  final String label;
  final bool selected;
  final ValueChanged<bool>? onSelected;
  final bool disabled;

  const CustomChoiceChip(
      {Key? key, required this.label, required this.selected, this.onSelected, this.disabled = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(label),
      selected: selected,
      onSelected: disabled ? null : onSelected,
      disabledColor: disabled ? Colors.grey : null,
      showCheckmark: false,
    );
  }
}