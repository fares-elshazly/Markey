import 'package:get/get.dart' hide Response;
import 'package:chopper/chopper.dart' hide Get;
import 'dart:io';

import '/Screens/Shared/splash.dart';
import '/Controllers/authentication_controller.dart';

abstract class AuthorizationInterceptors {
  static const _authorizationHeader = 'Authorization';
  static const _tokenType = 'Bearer';

  static final _authController = Get.find<AuthenticationController>();

  static Future<Request> authorizationRequest(Request request) async {
    final accessToken = _getAccessToken();
    return applyHeader(
      request,
      _authorizationHeader,
      accessToken,
      override: false,
    );
  }

  static Future<Response> authorizationResponse(Response response) async {
    if (response.statusCode == HttpStatus.unauthorized) _navigate();
    return response;
  }

  static String _getAccessToken() {
    final accessToken = _authController.accessToken;
    if (accessToken == null) return '';
    return '$_tokenType $accessToken';
  }

  static void _navigate() {
    Get.offAllNamed(SplashScreen.routeName);
  }
}
