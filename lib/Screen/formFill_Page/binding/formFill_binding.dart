import 'package:get/get.dart';
import 'package:resume_app/Screen/formFill_Page/controller/formFill_controller.dart';

class FormFillBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => FormFillController());
  }

}