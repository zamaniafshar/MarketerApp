import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductWidgetsController extends GetxController
    with SingleGetTickerProviderMixin {
  factory ProductWidgetsController(String tag) {
    try {
      final ProductWidgetsController controller = Get.find(tag: tag);
      return controller;
    } catch (e) {
      final instance = Get.put(ProductWidgetsController._init(), tag: tag);
      return instance;
    }
  }

  ProductWidgetsController._init();

  @override
  void onInit() {
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    super.onInit();
  }

  @override
  void onClose() {
    _animationController.dispose();
    super.onClose();
  }

  static String _previousTag = '';
  static bool _showDetails = false;

  final PageController pageController = PageController();
  late AnimationController _animationController;

  AnimationController get animationController => _animationController;

  static void onTap(String tag) {
    final ProductWidgetsController controller = Get.find(tag: tag);

    if (!_showDetails) {
      _previousTag = tag;

      controller.pageController.animateToPage(
        1,
        duration: Duration(milliseconds: 500),
        curve: Curves.ease,
      );

      _showDetails = true;

      controller._animationController.forward();
    } else {
      final ProductWidgetsController previousController =
          Get.find(tag: _previousTag);

      previousController.pageController.animateToPage(
        0,
        duration: Duration(milliseconds: 500),
        curve: Curves.ease,
      );

      _showDetails = false;

      previousController._animationController.animateBack(0.0);

      if (_previousTag != tag) {
        controller.pageController.animateToPage(
          1,
          duration: Duration(milliseconds: 500),
          curve: Curves.ease,
        );

        _showDetails = true;
        _previousTag = tag;

        controller._animationController.forward();
      }
    }
  }
}
