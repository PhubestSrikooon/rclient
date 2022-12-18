import 'package:flutter/material.dart';

class PaddingChip extends StatelessWidget {
  final String label;
  final void Function()? onPressed;
  const PaddingChip({super.key, required this.label, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8),
        child: ActionChip(label: Text(label), onPressed: onPressed));
  }
}
