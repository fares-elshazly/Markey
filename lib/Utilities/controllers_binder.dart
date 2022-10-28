import 'package:get/get.dart';

import '/Controllers/authentication_controller.dart';
import '/Controllers/tags_controller.dart';

class ControllersBinder implements Bindings {
  @override
  void dependencies() {
    Get.put(AuthenticationController());
    Get.put(TagsController());
  }
}
