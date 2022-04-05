import 'package:get/get.dart';
import 'package:marketer/controller/customers/add_or_edit_customer_screen_controller.dart';
import 'package:marketer/controller/customers/customers_list_controller.dart';
import 'package:marketer/data/models/customer.dart';
import 'package:marketer/ui/screens/customers/add_or_edit_customer_screen.dart';

class CustomerProfileController extends GetxController {
  @override
  void onInit() {
    _customer = Get.arguments;
    super.onInit();
  }

  Customer? _customer;

  Customer get customer => _customer!;

  void editCustomer() async {
    final isEditted =
        await Get.toNamed(AddOrEditCustomerScreen.name, arguments: customer);
    if (isEditted == null) return;
    _customer = Get.find<AddOrEditCustomerScreenController>().getCustomer();
    Get.find<CustomersListController>().editCustomer();
    update();
  }

  void deleteCustomer() {
    final CustomersListController controller = Get.find();
    controller.deleteCustomer(customer.id!);
  }
}
