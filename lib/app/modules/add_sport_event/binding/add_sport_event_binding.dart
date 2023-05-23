
import 'package:get/get.dart';

import '../controllers/sports_controller.dart';

class AddSportEventBinding implements Bindings {
  @override
  void dependencies() {
  
    Get.lazyPut<SportsController>(
      () => SportsController(),
    );
  }
}
