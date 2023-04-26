import 'dart:ui';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AppTranslations extends Translations {
  // Default locale
  final locale = const Locale('en');

  // fallbackLocale saves the day when the locale gets in trouble
  final fallbackLocale = const Locale('en');

  // Key
  static const String LANGUAGE = 'LANGUAGE';

  Future<void> init() async {
    final box = GetStorage();
    String? locale = box.read(LANGUAGE);
    if (locale == null) {
      Get.updateLocale(const Locale('en'));
      await box.write(LANGUAGE, 'en');
    } else {
      Get.updateLocale(Locale(locale));
    }
  }

  static void updateLocale({required String langCode}) {
    final box = GetStorage();
    Get.updateLocale(Locale(langCode));
    box.write(LANGUAGE, langCode);
  }

  @override
  Map<String, Map<String, String>> get keys => {
        'en': {
          'app_title': 'CorpU Employee',
          'yes': 'Yes',
          'no': 'No',
          'ok': 'OK',
          'welcome': 'Welcome',
          'continue_as': 'Continue As',
          'staff': 'Staff',
          'employee': 'Employee',
        },
      };
}
