import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/utils/ui/ui_settings.dart';
import 'package:get/get.dart';

import '../modules/sport_events_list/widgets/delete_dialog.dart';

class AppTools {
  void showSuccessSnackBar(String message, {int duration = 3, int timer = 0}) {
    if (timer > 0) {
      Future.delayed(Duration(seconds: timer), () {
        Get.showSnackbar(UI.successSnackBar(
            title: 'success', message: message.tr, duration: duration));
      });
    } else {
      Get.showSnackbar(UI.successSnackBar(
          title: 'success', message: message.tr, duration: duration));
    }
  }

  Future<void> deleteDialog(BuildContext context, int indexx) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return DeleteDialog(
          index: indexx,
        );
      },
    );
  }
}
