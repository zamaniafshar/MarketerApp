import 'package:get/get.dart';
import 'package:marketer/controller/customers/customer_profile_controller.dart';
import 'package:marketer/controller/invoices_list_controller.dart';

class CustomerProfileScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(CustomerProfileController());
    Get.put(InvoicesListController());
  }
}
