import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:marketer/controller/custom_fields_controller.dart';
import 'package:marketer/data/models/customer.dart';

import 'package:marketer/data/provider/location_info_provider.dart';
import 'package:marketer/ui/widgets/progress_button.dart';
import 'package:marketer/data/services/location_service.dart';
import 'package:marketer/data/models/lat_lon.dart';

class AddOrEditCustomerScreenController extends GetxController {
  @override
  void onInit() {
    _customFieldController = CustomFieldsController(
      validators: {
        'name': (value) =>
            value!.isEmpty ? 'لطفا نام مشتری را وارد کنید' : null,
        'phone number': (value) =>
            value!.isEmpty ? 'لطفا شماره تلفن را وارد کنید' : null,
        'address': (value) => value!.isEmpty ? 'لطفا ادرس را وارد کنید' : null,
        'province': (value) =>
            value!.isEmpty ? 'لطفا استان را وارد کنید' : null,
        'city': (value) => value!.isEmpty ? 'لطفا شهر را وارد کنید' : null,
      },
      savers: {
        'name': (value) => _name = value!,
        'phone number': (value) => _phoneNumber = value!,
        'address': (value) => _address = value!,
      },
    );
    _customer = Get.arguments;
    if (_customer != null) {
      provinceController.text = _customer!.province;
      cityController.text = _customer!.city;
      latLon = _customer!.latLon;
      _enabledEdit = true;
    }

    super.onInit();
  }

  Customer? _customer;

  late CustomFieldsController _customFieldController;
  late String _name;
  late String _phoneNumber;
  late String _address;

  late LatLon latLon;
  bool _enabledEdit = false;

  final TextEditingController provinceController = TextEditingController();
  final TextEditingController cityController = TextEditingController();

  final _locationButtonState = ButtonState.idle.obs;

  CustomFieldsController get customFieldController => _customFieldController;
  ButtonState? get locationButtonState => _locationButtonState.value;
  Customer? get customer => _customer;
  bool get enabledEdit => _enabledEdit;

  void loadLocationInfo() async {
    _locationButtonState.value = ButtonState.loading;
    try {
      latLon = await LocationService.getLocation();

      final data = await getLocationInfo(latLon: latLon);
      provinceController.text = data['province'];
      cityController.text =
          data['city'].isNotEmpty ? data['city'] : data['county'];

      _locationButtonState.value = ButtonState.success;
    } catch (e) {
      _locationButtonState.value = ButtonState.fail;
      print(e);
    }
  }

  Customer? getCustomer() {
    if (_customFieldController.checkFileds()) {
      _customer = Customer(
        id: _customer?.id,
        name: _name,
        phoneNumber: _phoneNumber,
        address: _address,
        province: provinceController.text,
        city: cityController.text,
        latLon: latLon,
      );
      return _customer;
    }
    return null;
  }
}
