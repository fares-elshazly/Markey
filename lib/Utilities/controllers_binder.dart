import 'package:get/get.dart';

import '/Controllers/authentication_controller.dart';
import '/Controllers/tags_controller.dart';
import '/Controllers/community_controller.dart';
import '/Controllers/tips_controller.dart';
import '/Controllers/profile_controller.dart';
import '/Controllers/services_controller.dart';
import '/Controllers/bookings_controller.dart';

class ControllersBinder implements Bindings {
  @override
  void dependencies() {
    Get.put(AuthenticationController());
    Get.put(TagsController());
    Get.put(CommunityController());
    Get.put(TipsController());
    Get.put(ProfileController());
    Get.put(ServicesController());
    Get.put(BookingsController());
  }
}
