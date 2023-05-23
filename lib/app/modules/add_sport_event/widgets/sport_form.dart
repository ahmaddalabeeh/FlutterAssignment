import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../utils/app_tools.dart';
import '../../../utils/ui/widgets/custom_floating_button.dart';
import '../../../utils/ui/widgets/text_field.dart';
import '../controllers/sports_controller.dart';

class SportForm extends StatelessWidget {
  final String label;
  final void Function() onPressed;

  const SportForm({super.key, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SportsController>();
    return Scaffold(
        floatingActionButton:
            CustomFloatingButton(onPressed: onPressed, label: label),
        appBar: AppBar(
          backgroundColor: Colors.blue.withOpacity(0.5),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Center(
            child: ListView(children: [
              Form(
                key: controller.titleFormKey,
                child: CustomTextField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'requiredField'.tr;
                    }
                    return null;
                  },
                  maxLines: 1,
                  controller: controller.titleController.value,
                  labelTxt: 'title',
                ),
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              CustomTextField(
                maxLines: 2,
                controller: controller.descriptionController.value,
                labelTxt: 'description',
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              CustomTextField(
                maxLines: 1,
                controller: controller.eventLocationController.value,
                labelTxt: 'location',
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              Obx(
                () => Form(
                  
                  key: controller.dateFormKey,
                  child: TextFormField(
                    
                    // controller: controller.dateController.value,
                    readOnly: true,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          controller.chooseDate();
                        },
                        icon: const Icon(
                          Icons.calendar_month,
                          color: Colors.lightGreen,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            width: Get.width * 0.003,
                            color: Colors.blue.withOpacity(0.5)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            width: Get.width * 0.003, color: Colors.black),
                      ),
                      hintText: controller.isDatePicked.value
                          ? DateFormat('EEE, M/d/y')
                              .format(controller.selectedDate.value)
                              .toString()
                          : 'eventDate'.tr,
                      hintStyle: Get.textTheme.bodyMedium?.copyWith(
                          color: controller.isDatePicked.value
                              ? Colors.blue.withOpacity(0.5)
                              : Colors.black,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              Obx(
                () => Form(
                  child: TextFormField(
                    readOnly: true,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          controller.showTimePickerDialog();
                        },
                        icon: const Icon(
                          Icons.access_time,
                          color: Colors.lightGreen,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            width: Get.width * 0.003,
                            color: Colors.blue.withOpacity(0.5)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            width: Get.width * 0.003, color: Colors.black),
                      ),
                      hintText: controller.isTimePicked.value
                          ? controller.selectedTime.value
                              .format(context)
                              .toString()
                          : 'eventTime'.tr,
                      hintStyle: Get.textTheme.bodyMedium?.copyWith(
                          color: controller.isTimePicked.value
                              ? Colors.blue.withOpacity(0.5)
                              : Colors.black,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              Form(
                key: controller.playerCountFormKey,
                child: CustomTextField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'requiredField'.tr;
                    }
                    return null;
                  },
                  textInputType: TextInputType.number,
                  maxLines: 1,
                  maxLength: 2,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  controller: controller.playerCountController.value,
                  labelTxt: 'maxPlayerCount',
                ),
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.blue.withOpacity(0.5))),
                onPressed: controller.pickImage,
                child: Text('imagePick'.tr),
              ),
              Obx(() => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(controller.imageName.value),
                  )),
            ]),
          ),
        ));
  }
}
