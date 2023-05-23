import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/modules/add_sport_event/controllers/sports_controller.dart';
import 'package:flutter_application_1/app/modules/sport_events_list/view/sport_event_list.dart';
import 'package:get/get.dart';

import '../../../utils/app_tools.dart';
import '../../sport_events_list/model/sport_event_model.dart';
import '../widgets/sport_form.dart';

class EditSportEvent extends GetView<SportsController> {
  final int id;
  const EditSportEvent({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return SportForm(
      label: 'edit',
      onPressed: () {
        if (controller.titleFormKey.currentState!.validate() &&
            controller.dateFormKey.currentState!.validate() &&
            controller.playerCountFormKey.currentState!.validate()) {
          controller.editSportEvent(SportsEventModel(
            id: id,
            title: controller.titleController.value.text,
            description: controller.descriptionController.value.text,
            date: controller.selectedDate.value,
            time: controller.selectedTime.value,
            imagePath: controller.imagePath.value,
            location: controller.eventLocationController.value.text,
            maxCountOfPlayers: controller.playerCountController.value.text,
          ));
          controller.clearController();
          Get.off(() => const SportEventsList());

          AppTools().showSuccessSnackBar('eventEdited');
        }
      },
    );
  }
}
