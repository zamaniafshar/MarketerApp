import 'package:get/get.dart';
import 'package:marketer/controller/bottom_nav_bar_controller.dart';
import 'package:marketer/controller/circular_menu_button_controller.dart';
import 'package:marketer/controller/customers/customers_list_controller.dart';
import 'package:marketer/controller/products_list_controller.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(BottomNavBarController());
    Get.put(CustomersListController());
    Get.put(ProductsListController());
    Get.put(CircularMenuButtonController());
  }
}
