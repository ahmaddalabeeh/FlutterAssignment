import 'package:flutter_application_1/app/modules/sport_events_list/widgets/sport_card_widget.dart';
import 'package:flutter_application_1/app/utils/sort_enum.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class SportEventListController extends GetxController {
  final RxString selectedLanguage = 'en'.obs;
  var sortBy = SortOption.date.obs;
  

  void sortItems(SortOption sortOption) {
    sortBy.value = sortOption;
    
  }

 

  // RxList<String> items = ['title'.tr, 'date'.tr].obs;
  void toggleLanguage() {
    if (selectedLanguage.value == 'en') {
      selectedLanguage.value = 'ar';
    } else {
      selectedLanguage.value = 'en';
    }
  }

  void sendWhatsAppMessage(String message) async {
    var whatsappAndroid =
        Uri.parse("whatsapp://send?text=${Uri.encodeComponent(message)}");
    if (await canLaunchUrl(whatsappAndroid)) {
      await launchUrl(whatsappAndroid);
    }
  }
}
