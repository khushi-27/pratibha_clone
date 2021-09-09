import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  final String text;
  final TextEditingController controller;
  final bool obscureText;
  const CustomFormField(
      {Key? key,
      required this.text,
      required this.controller,
      required this.obscureText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0.0),
      child: Container(
        height: 45.0,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(5.0)),
        child: TextFormField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
              hintText: text,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: const BorderSide(color: Colors.grey))),
        ),
      ),
    );
  }
}
