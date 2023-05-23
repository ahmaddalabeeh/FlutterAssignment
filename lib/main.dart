import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/modules/sport_events_list/binding/sport_event_list_binding.dart';
import 'package:flutter_application_1/app/modules/sport_events_list/view/sport_event_list.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

import 'app/services/translation_services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      showPerformanceOverlay: false,
      title: 'title'.tr,
      home: const SportEventsList(
      ),
      initialBinding: SportEventListBinding(),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      translations: TranslationService(),
      locale: TranslationService().getLocale(),
      fallbackLocale: TranslationService.fallbackLocale,
    );
  }
}
