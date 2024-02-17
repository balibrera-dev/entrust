import 'package:flutter/material.dart';

class TextBox extends StatelessWidget {
  const TextBox({
    super.key,
    required this.controller,
    required this.label,
    this.icon,
  });
  final TextEditingController controller;
  final String label;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: icon == null ? null : Icon(icon),
      ),
      autocorrect: false,
      textCapitalization: TextCapitalization.none,
      validator: (value) {},
      onSaved: (newValue) {
        // _enteredEmail = newValue!;
      },
    );
  }
}
