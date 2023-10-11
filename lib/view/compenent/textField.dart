import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final String labelText;
  final String hintText;
  final IconData iconData;
  TextInput(
      {super.key,
      required this.labelText,
      required this.hintText,
      required this.iconData});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          labelText: labelText,
          hintText: hintText,
          focusColor: Colors.green[400],
          prefixIcon: Icon(iconData)),
    );
  }
}
