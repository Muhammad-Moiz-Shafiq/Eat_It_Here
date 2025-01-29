import 'package:flutter/material.dart';

class MyTextfield extends StatelessWidget {
  MyTextfield(
      {super.key,
      required this.controller,
      required this.obscureText,
      required this.hintText});
  final TextEditingController controller;
  final bool obscureText;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Theme.of(context).colorScheme.tertiary),
        ),
      ),
    );
  }
}
