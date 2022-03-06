import 'package:get/instance_manager.dart';

import 'package:getx_apicall/controllers/controller.dart';

class ControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<Controller>(Controller());
  }
}
