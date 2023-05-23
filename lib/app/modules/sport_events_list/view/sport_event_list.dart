import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/modules/add_sport_event/binding/add_sport_event_binding.dart';
import 'package:flutter_application_1/app/modules/add_sport_event/controllers/sports_controller.dart';
import 'package:flutter_application_1/app/modules/add_sport_event/view/edit_sport_event_view.dart';
import 'package:flutter_application_1/app/modules/sport_events_list/controller/sport_event_list_controller.dart';
import 'package:flutter_application_1/app/modules/sport_events_list/view/empty_sport_list.dart';
import 'package:flutter_application_1/app/modules/sport_events_list/widgets/sport_card_widget.dart';
import 'package:flutter_application_1/app/utils/app_tools.dart';
import 'package:flutter_application_1/app/utils/sort_enum.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../utils/ui/widgets/custom_floating_button.dart';
import '../../add_sport_event/view/add_sport_event_view.dart';

class SportEventsList extends GetView<SportEventListController> {
  const SportEventsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final SportsController addSportsController = Get.find<SportsController>();

    return Scaffold(
      appBar: AppBar(
        actions: [
          Obx(
            () => DropdownButton<SortOption>(
              dropdownColor: Colors.blue.withOpacity(0.8),
              value: controller.sortBy.value,
              items: SortOption.values.map((SortOption sortBy) {
                return DropdownMenuItem<SortOption>(
                  value: sortBy,
                  child: Text(
                    sortBy.name.tr,
                    style:
                        Get.textTheme.bodyMedium?.copyWith(color: Colors.white),
                  ),
                );
              }).toList(),
              onChanged: (SortOption? newValue) {
                if (newValue != null) {
                  controller.sortItems(newValue);
                  switch (newValue) {
                    case SortOption.date:
                      addSportsController.sportEventsCard
                          .sort((a, b) => a.date.compareTo(b.date));
                      break;
                    case SortOption.title:
                      addSportsController.sportEventsCard
                          .sort((a, b) => a.title.compareTo(b.title));
                      break;
                    default:
                      addSportsController.sportEventsCard
                          .sort((a, b) => a.id.compareTo(b.id));
                      return;
                  }
                }
              },
            ),
          ),
        ],
        leadingWidth: 100,
        backgroundColor: Colors.blue.withOpacity(0.5),
        leading: TextButton(
          child: Text(
            controller.selectedLanguage.value == 'ar'
                ? 'English'.tr
                : 'Arabic'.tr,
            style: Get.textTheme.bodyMedium?.copyWith(color: Colors.white),
          ),
          onPressed: () {
            controller.toggleLanguage();
            Get.updateLocale(Locale(controller.selectedLanguage.value));
          },
        ),
      ),
      floatingActionButton: CustomFloatingButton(
          onPressed: () {
            Get.to(() => const AddSportEvent(),
                binding: AddSportEventBinding());
          },
          label: 'addEvent'),
      body: Obx(
        () => addSportsController.sportEventsCard.isEmpty
            ? const EmptySportListView()
            : ListView.builder(
                padding: EdgeInsets.only(bottom: Get.height * 0.02),
                itemCount: addSportsController.sportEventsCard.length,
                itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: SportEventCard(
                        onDeletePressed: () async {
                          await AppTools().deleteDialog(context, index);
                        },
                        onEditPressed: () {
                          final model =
                              addSportsController.sportEventsCard[index];

                          addSportsController.titleController.value.text =
                              model.title;
                          addSportsController.descriptionController.value.text =
                              model.description ?? '';
                          addSportsController.imageName.value =
                              model.imagePath ?? '';
                          addSportsController.dateController;
                          addSportsController.timeController;
                          addSportsController.eventLocationController.value
                              .text = model.location ?? '';
                          addSportsController.playerCountController.value.text =
                              model.maxCountOfPlayers;
                          Get.to(() => EditSportEvent(
                                id: addSportsController
                                    .sportEventsCard[index].id,
                              ));
                        },
                        imagePath: addSportsController
                            .sportEventsCard[index].imagePath,
                        time: addSportsController.sportEventsCard[index].time,
                        location:
                            addSportsController.sportEventsCard[index].location,
                        title: addSportsController.sportEventsCard[index].title,
                        description: addSportsController
                            .sportEventsCard[index].description,
                        date: addSportsController.sportEventsCard[index].date,
                        maxCountOfPlayers: addSportsController
                            .sportEventsCard[index].maxCountOfPlayers,
                        onTap: () {
                          controller.sendWhatsAppMessage(
                              'Please join me in this game! \n \n Game Title => ${addSportsController.sportEventsCard[index].title}\n Game Desc => ${addSportsController.sportEventsCard[index].description}\n Date => ${DateFormat('EEE, M/d/y').format(addSportsController.sportEventsCard[index].date)}\n Location => ${addSportsController.sportEventsCard[index].location}\n Max Count of players => ${addSportsController.sportEventsCard[index].maxCountOfPlayers}\n Time => ${addSportsController.sportEventsCard[index].time!.format(context)}');
                        },
                      ),
                    )),
      ),
    );
  }
}
