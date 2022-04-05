import 'package:get/get.dart';
import 'package:marketer/controller/customers/add_or_edit_customer_screen_controller.dart';

class AddOrEditCustomerScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AddOrEditCustomerScreenController());
  }
}
