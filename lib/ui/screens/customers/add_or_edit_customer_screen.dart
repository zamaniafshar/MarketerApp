import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:marketer/controller/customers/add_or_edit_customer_screen_controller.dart';
import 'package:marketer/controller/customers/customers_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketer/ui/widgets/progress_button.dart';

class AddOrEditCustomerScreen extends StatelessWidget {
  static const name = 'AddCustomerScreen';

  final CustomersListController _customersController = Get.find();
  final AddOrEditCustomerScreenController _addOrEditCustomerScreenController =
      Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.indigo,
      title: Text(
        _addOrEditCustomerScreenController.enabledEdit
            ? 'ویرایش اطلاعات'
            : 'افزودن مشتری',
      ),
      centerTitle: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(10),
        ),
      ),
    );
  }

  SingleChildScrollView _buildBody() {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        height: 550,
        child: Form(
          key: _addOrEditCustomerScreenController.customFieldController.formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // TODO:وقتی به ارور میخورن رنگ ایکون تغییر نمیکنه  درستش کن

              // get Customer name
              TextFormField(
                initialValue: _addOrEditCustomerScreenController.customer?.name,
                validator: _addOrEditCustomerScreenController
                    .customFieldController
                    .validators('name'),
                onSaved: _addOrEditCustomerScreenController
                    .customFieldController
                    .savers('name'),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  labelText: 'نام مشتری',
                  prefixIcon: Icon(CupertinoIcons.person_fill),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                ),
              ),
              // get customer phone number
              TextFormField(
                initialValue:
                    _addOrEditCustomerScreenController.customer?.phoneNumber,
                validator: _addOrEditCustomerScreenController
                    .customFieldController
                    .validators('phone number'),
                onSaved: _addOrEditCustomerScreenController
                    .customFieldController
                    .savers('phone number'),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                keyboardType: TextInputType.phone,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.call),
                  labelText: 'شماره تلفن',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                ),
              ),
              // get customer address
              TextFormField(
                initialValue:
                    _addOrEditCustomerScreenController.customer?.address,
                validator: _addOrEditCustomerScreenController
                    .customFieldController
                    .validators('address'),
                onSaved: _addOrEditCustomerScreenController
                    .customFieldController
                    .savers('address'),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                minLines: 1,
                maxLines: 2,
                expands: false,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.description_outlined),
                  labelText: 'ادرس و توضیحات',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                ),
              ),
              _LocationWidgets(_addOrEditCustomerScreenController),
              // add new customer button
              ElevatedButton(
                onPressed: () async {
                  final result = _addOrEditCustomerScreenController.enabledEdit
                      ? await _customersController.editCustomer()
                      : await _customersController.addCustomer();
                  if (result) Get.back(result: true);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
                  shape: MaterialStateProperty.all(
                    const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    _addOrEditCustomerScreenController.enabledEdit
                        ? 'ذخیره'
                        : 'افزودن مشتری',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LocationWidgets extends StatelessWidget {
  const _LocationWidgets(this.controller);

  final AddOrEditCustomerScreenController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        FocusScope(
          canRequestFocus: false,
          child: Row(
            children: [
              Flexible(
                child: TextFormField(
                  readOnly: true,
                  controller: controller.provinceController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator:
                      controller.customFieldController.validators('province'),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.maps_home_work),
                    labelText: 'استان',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 20),
              Flexible(
                child: TextFormField(
                  readOnly: true,
                  controller: controller.cityController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator:
                      controller.customFieldController.validators('city'),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.location_city),
                    labelText: 'شهر',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        UnconstrainedBox(
          child: Obx(
            () => ProgressButton.icon(
              state: controller.locationButtonState,
              onPressed: controller.loadLocationInfo,
              iconedButtons: const {
                ButtonState.idle: IconedButton(
                  text: 'گرفتن لوکیشن',
                  color: Colors.deepPurpleAccent,
                ),
                ButtonState.loading: IconedButton(color: Color(0xFF512DA8)),
                ButtonState.success: IconedButton(
                  text: 'با موفقیت انجام شد',
                  color: Colors.green,
                  icon: Icon(Icons.check_circle, color: Colors.white),
                ),
                ButtonState.fail: IconedButton(
                  text: 'خطا در اتصال به سرور',
                  color: Colors.red,
                  icon: Icon(Icons.cancel, color: Colors.white),
                ),
              },
            ),
          ),
        ),
      ],
    );
  }
}
