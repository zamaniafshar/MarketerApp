import 'package:marketer/controller/customers/customers_list_controller.dart';
import 'package:marketer/data/models/customer.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CustomerSearchController extends GetxController {
  @override
  void onInit() {
    _customerslist = Get.find<CustomersListController>().customersList;
    _searchedCustomers = _customerslist;

    debounce(_inputext, searchCustomers);

    super.onInit();
  }

  final inputTextController = TextEditingController();
  final _inputext = ''.obs;
  bool _isTyping = false;
  bool _isDone = true;
  late List<Customer> _customerslist;
  late List<Customer> _searchedCustomers;

  bool get isTyping => _isTyping;
  bool get isDone => _isDone;
  List<Customer> get searchedCustomers => _searchedCustomers;

  void onChangeTextInput(String value) {
    _isDone = false;
    if (value.isNotEmpty)
      _isTyping = true;
    else
      _isTyping = false;
    update(['CustomerListBuilder', 'IconBuilder']);
    _inputext.value = value;
  }

  void searchCustomers(value) {
    if (value.isEmpty) {
      _searchedCustomers = _customerslist;
    } else {
      _searchedCustomers = _customerslist
          .where((customer) => customer.name.startsWith(value))
          .toList();
    }
    _isDone = true;
    update(['CustomerListBuilder']);
  }

  void cleanTextInput() {
    if (_isTyping) {
      inputTextController.clear();
      onChangeTextInput(inputTextController.text);
    }
  }
}
