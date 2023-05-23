import 'dart:ui';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../utils/constants/lang/ar.dart';
import '../utils/constants/lang/en.dart';

class TranslationService extends Translations {
  GetStorage localStorage = GetStorage();

  static const locale = Locale('ar', 'SA');

  static const fallbackLocale = Locale('ar', 'SA');

  static final langs = [
    'en_US',
    'ar_SA',
  ];

  static final locales = [
    const Locale('ar', 'SA'),
    const Locale('en', 'US'),
  ];

  @override
  Map<String, Map<String, String>> get keys => {
        'ar_SA': ar,
        'en_US': en,
      };

  void changeLocale(String lang) async {
    if (lang == langs[0]) {
      Get.updateLocale(locales[0]);
      await localStorage.write('language', 'ar_SA');
    } else {
      Get.updateLocale(locales[1]);
      await localStorage.write('language', 'en_US');
    }
  }

  Locale getLocale() {
    String? currentLocale = localStorage.read('language');
    if (currentLocale == null || currentLocale == 'en_US') return locales[1];

    return locales[0];
  }

  String getLocaleLanguageCode() {
    String? currentLocale = localStorage.read('language');
    if (currentLocale == null || currentLocale == 'ar_SA') {
      return locales[0].languageCode;
    }

    return locales[1].languageCode;
  }

  bool isLocaleArabic() {
    return Get.locale == const Locale('ar', 'SA');
  }
}
