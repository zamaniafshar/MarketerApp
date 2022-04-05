import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketer/controller/product_widgets_controller.dart';
import 'package:marketer/controller/products_list_controller.dart';
import 'package:marketer/ui/widgets/custom_list_view.dart';
import 'package:marketer/ui/widgets/product_widget.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  Padding _buildBody() {
    return Padding(
      padding: const EdgeInsets.only(top: kToolbarHeight + 20),
      child: GetBuilder<ProductsListController>(
        builder: (controller) => CustomListView(
          length: controller.productList.length,
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          builder: (context, index) {
            final tag = index.toString();
            final newController = ProductWidgetsController(tag);

            return ProductWidget(
              product: controller.productList[index],
              pageController: newController.pageController,
              onTap: ProductWidgetsController.onTap,
              tag: tag,
            );
          },
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text(
        'انبار مرکزی',
        style: TextStyle(
          fontFamily: 'Iransans',
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.indigo,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
      ),
    );
  }
}
