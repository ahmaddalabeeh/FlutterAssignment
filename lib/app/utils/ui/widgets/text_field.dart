import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelTxt;
  final int maxLines;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? textInputType;
  final String? Function(String?)? validator;
  const CustomTextField(
      {super.key,
      this.maxLength,
      required this.maxLines,
      this.labelTxt = '',
      required this.controller,
      this.validator,
      this.textInputType,
      this.inputFormatters});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        maxLength: maxLength,
        keyboardType: textInputType,
        inputFormatters: inputFormatters,
        validator: validator,
        controller: controller,
        maxLines: maxLines,
        style: Get.textTheme.bodyMedium
            ?.copyWith(color: Colors.blue.withOpacity(0.5)),
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    BorderSide(width: Get.width * 0.003, color: Colors.black)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  width: Get.width * 0.003,
                  color: const Color.fromARGB(255, 158, 158, 158),
                )),
            label: Text(labelTxt.tr),
            hintStyle: const TextStyle(
                color: Color.fromARGB(255, 158, 158, 158), fontSize: 13)));
  }
}
