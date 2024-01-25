import 'package:flutter/material.dart';
import 'package:get/get.dart';



class CustomSnackBar {
  static showSnackBar({headerText, bodyText}) {
    Get.closeAllSnackbars();
    Get.snackbar(headerText, bodyText,
        snackPosition: SnackPosition.TOP,
        colorText:Colors.cyan,
        backgroundColor: Colors.orange.shade50,
        margin: const EdgeInsets.only(bottom: 26, left: 16, right: 16));
  }
}