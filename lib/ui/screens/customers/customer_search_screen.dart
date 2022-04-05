import 'package:marketer/controller/customers/customer_search_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketer/ui/widgets/custom_list_view.dart';
import 'package:marketer/ui/widgets/customers/customer_widget.dart';

const _closeIcon = Icon(Icons.close);
const _searchIcon = Icon(Icons.search, size: 30);

class CustomerSearchScreen extends StatelessWidget {
  static const name = 'CustomerSerachScreen';

  final customerSearchController = Get.find<CustomerSearchController>();

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
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(10),
        ),
      ),
      leading: IconButton(
        splashRadius: 25,
        icon: Icon(
          Icons.arrow_back,
        ),
        onPressed: () {
          Get.back();
        },
      ),
      title: TextField(
        controller: customerSearchController.inputTextController,
        onChanged: customerSearchController.onChangeTextInput,
        autofocus: true,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: 'جستجو ...',
          border: InputBorder.none,
          hintStyle: TextStyle(color: Colors.white),
        ),
      ),
      actions: [
        GetBuilder<CustomerSearchController>(
          id: 'IconBuilder',
          builder: (controller) => IconButton(
            splashRadius: 25,
            disabledColor: Colors.white,
            icon: controller.isTyping ? _closeIcon : _searchIcon,
            onPressed: controller.isTyping ? controller.cleanTextInput : null,
          ),
        )
      ],
    );
  }

  GetBuilder<CustomerSearchController> _buildBody() {
    return GetBuilder<CustomerSearchController>(
      id: 'CustomerListBuilder',
      builder: (controller) {
        return CustomListView(
          isDone: controller.isDone,
          length: controller.searchedCustomers.length,
          message: const Center(child: Text('مشتری پیدا نشد')),
          padding: const EdgeInsets.only(bottom: 20),
          builder: (context, index) =>
              CustomerWidget(controller.searchedCustomers[index]),
        );
      },
    );
  }
}
