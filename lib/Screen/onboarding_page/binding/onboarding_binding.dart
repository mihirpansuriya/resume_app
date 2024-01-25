import 'package:get/get.dart';
import 'package:resume_app/Screen/onboarding_page/controller/onboarding_controller.dart';

class OnBoardingBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => OnboardingController());
  }

}