import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resume_app/Screen/Routes/screen_routes.dart';
import 'package:resume_app/Screen/onboarding_page/controller/onboarding_controller.dart';

import '../../utils/size_utils.dart';

class OnBoardingScreen extends GetWidget<OnboardingController> {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: w(context, 20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                Get.toNamed(AppRoutes.formFillScreen);
              },
              child: Card(
                color: Colors.cyan,
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: h(context, 12)),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                      child: Text(
                    "Create Resume",
                    style: TextStyle(
                        fontSize: f(context, 18),
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  )),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Get.toNamed(AppRoutes.resumeScreen);
              },
              child: Card(
                color: Colors.cyan,
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: h(context, 12)),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                      child: Text(
                    "Show Resume",
                    style: TextStyle(
                        fontSize: f(context, 18),
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
