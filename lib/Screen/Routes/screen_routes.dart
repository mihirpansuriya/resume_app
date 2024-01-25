import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:resume_app/Screen/formFill_Page/binding/formFill_binding.dart';
import 'package:resume_app/Screen/formFill_Page/formFill_screen.dart';
import 'package:resume_app/Screen/onboarding_page/binding/onboarding_binding.dart';
import 'package:resume_app/Screen/onboarding_page/onboarding_screen.dart';
import 'package:resume_app/Screen/resume_page/binding/resume_binding.dart';
import 'package:resume_app/Screen/resume_page/resume_screen.dart';

class AppRoutes{
  static const String formFillScreen = '/formFillScreen';
  static const String resumeScreen = '/resumeScreen';
  static const String onBoardingScreen = '/onBoardingScreen';
  static List<GetPage> pages = [
    GetPage(
        name: formFillScreen,
        page: () =>  const FormFillScreen(),
        bindings: [
          FormFillBinding(),
        ],
        transitionDuration: const Duration(milliseconds: 150)),
    GetPage(
        name: resumeScreen,
        page: () => const ResumeScreen(),
        bindings: [
          ResumeBinding(),
        ],
        transitionDuration: const Duration(milliseconds: 150)),
    GetPage(
        name: onBoardingScreen,
        page: () => const OnBoardingScreen(),
        bindings: [
          OnBoardingBinding(),
        ],
        transitionDuration: const Duration(milliseconds: 150)),
  ];
}