import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';

class FormFieldWidget extends StatelessWidget {
  final String labelText;
  final String hintText;
  final bool? obscureText;
  final TextEditingController? controller;

  const FormFieldWidget(
      {super.key,
      required this.labelText,
      required this.hintText,
      this.obscureText,
      this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(labelText).textColor(Colors.white).fontSize(18),
        5.heightBox,
        TextFormField(
          controller: controller,
          // obscureText: obscureText ?? false,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.white),
            filled: true,
            fillColor: const Color(0x5594E9B7),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                width: 2,
                color: Colors.white,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                width: 2,
                color: Colors.white,
              ),
            ),
          ),
        ),
        10.heightBox,
      ],
    );
  }
}
