import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CircularMenuButtonController extends GetxController
    with SingleGetTickerProviderMixin {
  @override
  void onInit() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 250));

    _buttonOneAnimation = TweenSequence([
      TweenSequenceItem(tween: Tween(begin: 0.0, end: 1.75), weight: 35.0),
      TweenSequenceItem(tween: Tween(begin: 1.75, end: 1.0), weight: 65.0)
    ]).animate(_animationController);
    _buttonTwoAnimation = TweenSequence([
      TweenSequenceItem(tween: Tween(begin: 0.0, end: 1.4), weight: 55.0),
      TweenSequenceItem(tween: Tween(begin: 1.4, end: 1.0), weight: 45.0)
    ]).animate(_animationController);
    _buttonThreeAnimation = TweenSequence([
      TweenSequenceItem(tween: Tween(begin: 0.0, end: 1.2), weight: 75.0),
      TweenSequenceItem(tween: Tween(begin: 1.2, end: 1.0), weight: 25.0),
    ]).animate(_animationController);

    _rotationAnimation = Tween(begin: 180.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );

    _animationController.addListener(() {
      update();
    });
    super.onInit();
  }

  late Animation _buttonOneAnimation,
      _buttonTwoAnimation,
      _buttonThreeAnimation;
  late Animation _rotationAnimation;
  late AnimationController _animationController;

  bool _isOpen = false;

  Animation get buttonOneAnimation => _buttonOneAnimation;
  Animation get buttonTwoAnimation => _buttonTwoAnimation;
  Animation get buttonThreeAnimation => _buttonThreeAnimation;
  Animation get rotationAnimation => _rotationAnimation;
  AnimationController get animationController => _animationController;

  bool get isOpen => _isOpen;

  void closeMenu({bool delay = false}) {
    if (delay) {
      Future.delayed(
        Duration(seconds: 1),
        () {
          _animationController.reverse();
          _isOpen = false;
        },
      );
    } else {
      _animationController.reverse();
      _isOpen = false;
    }
  }

  void openMenu() {
    _animationController.forward();
    _isOpen = true;
  }

  double getRadiansFromDegree(double degree) {
    const unitRadian = 57.295779513;
    return degree / unitRadian;
  }

  void mainButtonAction() {
    if (_isOpen)
      closeMenu();
    else
      openMenu();
  }
}
