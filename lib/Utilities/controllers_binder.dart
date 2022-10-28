import 'package:get/get.dart';

import '/Controllers/authentication_controller.dart';

class ControllersBinder implements Bindings {
  @override
  void dependencies() {
    Get.put(AuthenticationController());
  }
}
