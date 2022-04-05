import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketer/controller/bottom_nav_bar_controller.dart';
import 'package:marketer/ui/widgets/circular_menu_button.dart';
import 'package:marketer/ui/widgets/custom_bottom_nav_bar.dart';
import 'package:marketer/ui/screens/customers/customers_screen.dart';
import 'package:marketer/ui/screens/store_screen.dart';
import 'package:marketer/ui/widgets/circular_menu_button.dart';
import 'package:marketer/utils/custom_snack_bars.dart';

class MainScreen extends StatelessWidget {
  static const name = 'MainScreen';

  static final _screens = [
    const CustomersScreen(),
    const StoreScreen(),
  ];

  const MainScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: _buildBody(),
      floatingActionButton: Container(height: 65, width: 65),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  GetBuilder _buildBottomNavBar() => GetBuilder<BottomNavBarController>(
        builder: (controller) => CustomBottomNavBar(
          currentIndex: controller.index,
          onTap: controller.onTap,
        ),
      );

  Padding _buildBody() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          GetBuilder<BottomNavBarController>(
            builder: (controller) => IndexedStack(
              index: controller.index,
              children: _screens,
            ),
          ),
          const CircularMenuButton(),
        ],
      ),
    );
  }
}
