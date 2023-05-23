import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UI {
  static GetSnackBar successSnackBar(
      {String title = 'success', String? message, int duration = 2}) {
    return GetSnackBar(
      titleText: Text(title.tr,
          style: Get.textTheme.bodyMedium!.merge(const TextStyle(
              color: Colors.white, fontWeight: FontWeight.w500))),
      messageText: Text(message!,
          style: Get.textTheme.bodySmall!.merge(const TextStyle(
              color: Colors.white, fontWeight: FontWeight.w500, height: 1.5))),
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(24.0),
      backgroundColor: Get.theme.primaryColor,
      icon: const Icon(Icons.check, size: 24.0, color: Colors.white),
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      borderRadius: 10,
      duration: Duration(seconds: duration),
      barBlur: 30.0,
      overlayBlur: 1.2,
    );
  }
}
