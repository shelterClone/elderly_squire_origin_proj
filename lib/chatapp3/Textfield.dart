import 'package:flutter/material.dart';


class Textfield extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final Widget prefix;
  final bool obscuretext;
  final TextInputType keyboardType;
  const Textfield(
      {Key key,
      this.controller,
      this.hint,
      this.prefix,
      this.obscuretext,
      this.keyboardType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        obscureText: obscuretext==true,
        keyboardType: keyboardType,
        decoration: InputDecoration(prefixIcon: prefix, hintText: hint ?? ''));
  }
}
