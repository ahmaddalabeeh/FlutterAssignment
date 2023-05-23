import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/modules/sport_events_list/model/sport_event_model.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class SportsController extends GetxController {
  Rx<TextEditingController> titleController = TextEditingController().obs;
  Rx<TextEditingController> playerCountController = TextEditingController().obs;
  Rx<TextEditingController> eventLocationController =
      TextEditingController().obs;
  Rx<TextEditingController> timeController = TextEditingController().obs;
  Rx<TextEditingController> descriptionController = TextEditingController().obs;
  Rx<TextEditingController> dateController = TextEditingController().obs;
  RxBool isDatePicked = false.obs;
  RxBool isTimePicked = false.obs;

  final titleFormKey = GlobalKey<FormState>();
  final dateFormKey = GlobalKey<FormState>();

  RxString imageName = RxString('');
  RxString imagePath = RxString('');
  Rx<TimeOfDay> selectedTime = TimeOfDay.now().obs;

  void setImagePath(String path) {
    imagePath.value = path;
  }

  void setImageName(String name) {
    imageName.value = name;
  }

  Future<void> pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setImagePath(pickedFile.path);

      setImageName(pickedFile.name);
    }
  }

  final playerCountFormKey = GlobalKey<FormState>();

  var selectedDate = DateTime.now().obs;

  final RxList<SportsEventModel> sportEventsCard = <SportsEventModel>[].obs;
  void addSportsEvent(SportsEventModel model) {
    sportEventsCard.add(model);
    update();
  }

  void editSportEvent(SportsEventModel model) {
    // print(model.id);
    final oldModel = sportEventsCard.firstWhere((element) {
      print("element id is ${element.id}");
      print("model id is ${model.id}");

      return element.id == model.id;
    });
    oldModel.title = model.title;
    oldModel.description = model.description;
    oldModel.imagePath = model.imagePath;
    oldModel.date = model.date;
    oldModel.maxCountOfPlayers = model.maxCountOfPlayers;
    oldModel.time = model.time;
    oldModel.location = model.location;
  }

  @override
  void onInit() {
    titleController.value = TextEditingController();
    descriptionController.value = TextEditingController();
    playerCountController.value = TextEditingController();
    eventLocationController.value = TextEditingController();
    dateController.value = TextEditingController();
    timeController.value = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    titleController.value.dispose();
    eventLocationController.value.dispose();
    timeController.value.dispose();

    descriptionController.value.dispose();
    playerCountController.value.dispose();

    dateController.value.dispose();
    super.onClose();
  }

  chooseDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: selectedDate.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );

    // print(pickedDate);

    if (pickedDate != null && pickedDate != selectedDate.value) {
      isDatePicked.value = true;
      selectedDate.value = pickedDate;
    }
  }

  Future<void> showTimePickerDialog() async {
    final selectedTime = await Get.dialog<TimeOfDay>(
      TimePickerDialog(
        initialTime: TimeOfDay.now(),
      ),
      barrierDismissible: false,
    );
    print(selectedTime);
    if (selectedTime != null) {
      updateTime(selectedTime);
      isTimePicked.value = true;
    }
  }

  void updateTime(TimeOfDay newTime) {
    selectedTime.value = newTime;
  }
  void clearController(){
        titleController.value.clear();
          descriptionController.value.clear();
          eventLocationController.value.clear();
        isDatePicked.value = false;
          isTimePicked.value = false;
          playerCountController.value.clear();
          imageName.value = '';
  }
}
