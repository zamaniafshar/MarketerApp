import 'package:get/get.dart';

class BottomNavBarController extends GetxController {
  int _index = 0;

  int get index => _index;

  void onTap(int newIndex) {
    if (_index == newIndex) return;
    _index = newIndex;
    update();
  }
}
