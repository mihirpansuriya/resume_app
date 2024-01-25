import 'package:get/get.dart';
import 'package:resume_app/Screen/resume_page/controller/resume_controller.dart';

class ResumeBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => ResumeController());
  }

}