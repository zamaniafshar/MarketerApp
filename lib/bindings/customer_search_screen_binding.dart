import 'package:get/get.dart';
import 'package:marketer/controller/customers/customer_search_controller.dart';

class CustomerSerachScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(CustomerSearchController());
  }
}
