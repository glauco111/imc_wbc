import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {Key? key,
      required this.controller,
      required this.labelText,
      required this.validateText})
      : super(key: key);
  final TextEditingController controller;
  final String labelText;
  final String validateText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      style: TextStyle(color: Colors.blueAccent, fontSize: 25.0),
      decoration: InputDecoration(
          labelText: labelText, labelStyle: TextStyle(color: Colors.black)),
      textAlign: TextAlign.center,
      validator: (value) {
        if (value == '') {
          return validateText;
        }
      },
    );
  }
}
