import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'Screens/Shared/splash.dart';

import 'Resources/translations.dart';

import 'Factories/colors_factory.dart';

import 'Enums/locales.dart';

import 'Utilities/helpers.dart';
import 'Utilities/controllers_binder.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  Helpers.setupLogger();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Markey',
      debugShowCheckedModeBanner: false,
      theme: _getTheme(),
      translations: MRKTranslations(),
      locale: Get.deviceLocale,
      fallbackLocale: SupportedLocales.enLocale,
      initialBinding: ControllersBinder(),
      initialRoute: SplashScreen.routeName,
      getPages: _getRoutes,
    );
  }

  ThemeData _getTheme() {
    return ThemeData(
      scaffoldBackgroundColor: ColorsFactory.background,
      primaryColor: ColorsFactory.primary,
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: ColorsFactory.primary,
      ),
    );
  }

  List<GetPage> get _getRoutes {
    return [
      // * Shared Screens
      GetPage(name: SplashScreen.routeName, page: () => const SplashScreen()),
    ];
  }
}
