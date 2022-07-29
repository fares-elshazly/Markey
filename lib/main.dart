import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'Screens/Shared/splash.dart';

import 'Screens/Authentication/login.dart';
import 'Screens/Authentication/register.dart';
import 'Screens/Authentication/forgot_password.dart';
import 'Screens/Authentication/verify_code.dart';
import 'Screens/Authentication/reset_password.dart';

import 'Screens/Viewer/viewer.dart';
import 'Screens/Viewer/home.dart';
import 'Screens/Viewer/chat.dart';
import 'Screens/Viewer/notifications.dart';
import 'Screens/Viewer/profile.dart';

import 'Screens/Tips/tips.dart';

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
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.dark.copyWith(
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.light,
    ),
  );
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
      locale: SupportedLocales.enLocale,
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

      // * Authentication Screens
      GetPage(name: LoginScreen.routeName, page: () => LoginScreen()),
      GetPage(name: RegisterScreen.routeName, page: () => RegisterScreen()),
      GetPage(name: ForgotPasswordScreen.routeName, page: () => ForgotPasswordScreen()),
      GetPage(name: VerifyCodeScreen.routeName, page: () => VerifyCodeScreen()),
      GetPage(name: ResetPasswordScreen.routeName, page: () => ResetPasswordScreen()),

      // * Viewer Screens
      GetPage(name: ViewerScreen.routeName, page: () => const ViewerScreen()),
      GetPage(name: HomeScreen.routeName, page: () => const HomeScreen()),
      GetPage(name: ChatScreen.routeName, page: () => const ChatScreen()),
      GetPage(name: NotificationsScreen.routeName, page: () => const NotificationsScreen()),
      GetPage(name: ProfileScreen.routeName, page: () => const ProfileScreen()),

      // * Tips Screens
      GetPage(name: TipsScreen.routeName, page: () => const TipsScreen()),
    ];
  }
}
