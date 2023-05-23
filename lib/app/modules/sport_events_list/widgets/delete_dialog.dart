import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/modules/add_sport_event/controllers/sports_controller.dart';
import 'package:get/get.dart';

class DeleteDialog extends GetView<SportsController> {
  final int index;
  const DeleteDialog( {super.key,required this.index});

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'confirmationMessage'.tr,
              style: Get.textTheme.bodyMedium?.copyWith(color: Colors.red),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'deleteionConfirmation'.tr,
              style: Get.textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.blue.withOpacity(0.5))),
                onPressed: () {
                  controller.sportEventsCard.removeAt(index);

                  Get.back();
                },
                child: Text('delete'.tr))
          ],
        ).paddingAll(8),
      ],
    );
  }
}
