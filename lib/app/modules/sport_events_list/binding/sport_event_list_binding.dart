import 'package:flutter_application_1/app/modules/add_sport_event/controllers/sports_controller.dart';
import 'package:get/get.dart';

import '../controller/sport_event_list_controller.dart';

class SportEventListBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SportEventListController>(
      () => SportEventListController(),
    );
    Get.lazyPut<SportsController>(
      () => SportsController(),
    );
  }
}
