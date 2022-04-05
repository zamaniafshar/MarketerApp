import 'package:marketer/controller/customers/customers_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketer/ui/screens/customers/customer_search_screen.dart';
import 'package:marketer/ui/widgets/custom_list_view.dart';
import 'package:marketer/ui/widgets/customers/customer_widget.dart';

class CustomersScreen extends StatelessWidget {
  static const name = 'CustomerScreen';

  const CustomersScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  Padding _buildBody() => Padding(
        padding: const EdgeInsets.only(top: kToolbarHeight + 20),
        child: GetBuilder<CustomersListController>(
          builder: (controller) => CustomListView(
            isDone: controller.isDone,
            length: controller.customersList.length,
            message: const Center(child: Text('مشتری وجود ندارد')),
            padding: const EdgeInsets.only(bottom: 60, top: 10),
            builder: (context, index) => CustomerWidget(
              controller.customersList[index],
              showDivider: controller.customersList.length - 1 != index,
            ),
          ),
        ),
      );

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.indigo,
      title: const Text(
        'مشتری ها',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontFamily: 'Iransans',
        ),
      ),
      centerTitle: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(10),
        ),
      ),
      leading: const SortListButton(),
      actions: [
        IconButton(
          splashRadius: 25,
          icon: const Icon(
            Icons.search,
            size: 30,
          ),
          onPressed: () {
            Get.toNamed(
              CustomerSearchScreen.name,
            );
          },
        )
      ],
    );
  }
}

class SortListButton extends StatelessWidget {
  const SortListButton();
  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashRadius: 25,
      icon: const Icon(
        Icons.more_vert,
        size: 30,
      ),
      onPressed: () {},
    );
  }
}
