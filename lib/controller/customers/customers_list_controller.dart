import 'package:marketer/controller/customers/add_or_edit_customer_screen_controller.dart';
import 'package:marketer/data/models/customer.dart';
import 'package:get/get.dart';
import 'package:marketer/data/models/lat_lon.dart';

class CustomersListController extends GetxController {
  @override
  void onInit() {
    readAllCustomer().then((value) {
      _isDone = true;
      update();
    });

    super.onInit();
  }

  List<Customer> _customersList = [];
  bool _isDone = false;

  bool get isDone => _isDone;
  List<Customer> get customersList => _customersList;

  void deleteCustomer(int id) async {
    // TODO: req server to delete user and if response was true delte user in the list
    _customersList.removeWhere((item) => item.id == id);
    update();
  }

  Future<void> readAllCustomer() async {
    // TODO: req server to get 15 customers
    _customersList = [
      Customer(
        id: 1,
        name: 'محسن گلستان',
        phoneNumber: '09135813299',
        address: 'خیابان امام',
        province: 'کرمان',
        city: 'بافت',
        latLon: LatLon(lat: 12, lon: 13),
      ),
      Customer(
        id: 2,
        name: 'محسن گلستان',
        phoneNumber: '09135813299',
        address: 'خیابان امام',
        province: 'کرمان',
        city: 'بافت',
        latLon: LatLon(lat: 12, lon: 13),
      ),
      Customer(
        id: 3,
        name: 'محسن گلستان',
        phoneNumber: '09135813299',
        address: 'خیابان امام',
        province: 'کرمان',
        city: 'بافت',
        latLon: LatLon(lat: 12, lon: 13),
      ),
      Customer(
        id: 4,
        name: 'محسن گلستان',
        phoneNumber: '09135813299',
        address: 'خیابان امام',
        province: 'کرمان',
        city: 'بافت',
        latLon: LatLon(lat: 12, lon: 13),
      ),
      Customer(
        id: 5,
        name: 'محسن گلستان',
        phoneNumber: '09135813299',
        address: 'خیابان امام',
        province: 'کرمان',
        city: 'بافت',
        latLon: LatLon(lat: 12, lon: 13),
      ),
      Customer(
        id: 6,
        name: 'محسن گلستان',
        phoneNumber: '09135813299',
        address: 'خیابان امام',
        province: 'کرمان',
        city: 'بافت',
        latLon: LatLon(lat: 12, lon: 13),
      ),
      Customer(
        id: 7,
        name: 'محسن گلستان',
        phoneNumber: '09135813299',
        address: 'خیابان امام',
        province: 'کرمان',
        city: 'بافت',
        latLon: LatLon(lat: 12, lon: 13),
      ),
      Customer(
        id: 8,
        name: 'محسن گلستان',
        phoneNumber: '09135813299',
        address: 'خیابان امام',
        province: 'کرمان',
        city: 'بافت',
        latLon: LatLon(lat: 12, lon: 13),
      ),
      Customer(
        id: 9,
        name: 'محسن گلستان',
        phoneNumber: '09135813299',
        address: 'خیابان امام',
        province: 'کرمان',
        city: 'بافت',
        latLon: LatLon(lat: 12, lon: 13),
      ),
    ];
  }

  Future<bool> addCustomer() async {
    final AddOrEditCustomerScreenController addCustomerScreenController =
        Get.find();
    final customer = addCustomerScreenController.getCustomer();

    if (customer == null) return false;

    // TODO: req server to add customer and if response was true add user in the first of list
    customersList.insert(0, customer);
    update();
    return true;
  }

  Future<bool> editCustomer() async {
    final AddOrEditCustomerScreenController addCustomerScreenController =
        Get.find();
    final customer = addCustomerScreenController.getCustomer();

    if (customer == null) return false;

    // TODO: req server to add customer and if response was true add user in the first of list

    final previousCustomerIndex =
        customersList.indexWhere((item) => item.id == customer.id);
    customersList.replaceRange(
        previousCustomerIndex, previousCustomerIndex + 1, [customer]);
    update();
    return true;
  }
}
