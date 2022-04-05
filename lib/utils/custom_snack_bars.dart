import 'package:get/get.dart';
import 'package:flutter/material.dart';

void showSuccessSnackBar(final String message) {
  Get.snackbar(
    '',
    '',
    titleText: Container(),
    isDismissible: true,
    shouldIconPulse: false,
    backgroundColor: Colors.green,
    snackPosition: SnackPosition.BOTTOM,
    dismissDirection: SnackDismissDirection.HORIZONTAL,
    forwardAnimationCurve: Curves.easeOutBack,
    duration: const Duration(seconds: 2),
    margin: const EdgeInsets.only(bottom: 25, right: 25, left: 25),
    padding: EdgeInsets.zero,
    messageText: Padding(
      padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
      child: FittedBox(
        child: Text(
          message,
          style: const TextStyle(color: Colors.white, fontSize: 20),
          maxLines: 1,
        ),
      ),
    ),
    icon: const Icon(
      Icons.done,
      color: Colors.white,
      size: 30,
    ),
  );
}
