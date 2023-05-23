import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/modules/add_sport_event/controllers/sports_controller.dart';
import 'package:flutter_application_1/app/modules/add_sport_event/widgets/sport_form.dart';
import 'package:flutter_application_1/app/utils/app_tools.dart';
import 'package:get/get.dart';

import '../../sport_events_list/model/sport_event_model.dart';

class AddSportEvent extends GetView<SportsController> {
  const AddSportEvent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SportForm(
      label: 'add',
      onPressed: () {
        if (controller.titleFormKey.currentState!.validate() &&
            controller.dateFormKey.currentState!.validate() &&
            controller.playerCountFormKey.currentState!.validate()) {
          controller.addSportsEvent(SportsEventModel(
            id: controller.sportEventsCard.length,
            title: controller.titleController.value.text,
            description: controller.descriptionController.value.text,
            date: controller.selectedDate.value,
            time: controller.selectedTime.value,
            imagePath: controller.imagePath.value,
            location: controller.eventLocationController.value.text,
            maxCountOfPlayers: controller.playerCountController.value.text,
          ));
          controller.clearController();

          Get.back();
          AppTools().showSuccessSnackBar('eventAdded');
        }
      },
    );
  }
}
