import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomFloatingButton extends StatelessWidget {
  final void Function() onPressed;
  final String label;
  const CustomFloatingButton({super.key, required this.onPressed, required this.label});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
        backgroundColor: Colors.blue.withOpacity(0.5),
        label: Text(label.tr),
        onPressed: onPressed);
  }
}
