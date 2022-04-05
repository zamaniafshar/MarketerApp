import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketer/controller/circular_menu_button_controller.dart';
import 'package:marketer/ui/widgets/circular_button.dart';
import 'package:marketer/ui/screens/customers/add_or_edit_customer_screen.dart';

import 'package:marketer/utils/custom_snack_bars.dart';

const _closeIcon = const Icon(
  Icons.close,
  color: Colors.white,
);
const _addIcon = const Icon(
  Icons.add,
  color: Colors.white,
  size: 30,
);

class CircularMenuButton extends StatelessWidget {
  const CircularMenuButton();

  @override
  Widget build(BuildContext context) {
    final CircularMenuButtonController controller = Get.find();
    return SizedBox(
      width: 300,
      height: 300,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          GetBuilder<CircularMenuButtonController>(
            builder: (_) => Transform.translate(
              offset: Offset.fromDirection(controller.getRadiansFromDegree(215),
                  controller.buttonOneAnimation.value * 120),
              child: Transform(
                transform: Matrix4.rotationZ(controller
                    .getRadiansFromDegree(controller.rotationAnimation.value))
                  ..scale(controller.buttonOneAnimation.value),
                alignment: Alignment.center,
                child: CircularButton(
                  elevation: 5,
                  color: Colors.orange,
                  child: const Icon(
                    Icons.person_add,
                    color: Colors.white,
                  ),
                  onTap: () async {
                    controller.closeMenu(delay: true);
                    var isSuccess =
                        await Get.toNamed(AddOrEditCustomerScreen.name);

                    if (isSuccess ?? false) {
                      Future.delayed(
                        Duration(seconds: 1),
                        () => showSuccessSnackBar(
                          'عملیات افزودن کاربر با موفقیت انجام شد',
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
          ),
          GetBuilder<CircularMenuButtonController>(
            builder: (_) => Transform.translate(
              offset: Offset.fromDirection(controller.getRadiansFromDegree(270),
                  controller.buttonTwoAnimation.value * 90),
              child: Transform(
                transform: Matrix4.rotationZ(controller
                    .getRadiansFromDegree(controller.rotationAnimation.value))
                  ..scale(controller.buttonTwoAnimation.value),
                alignment: Alignment.center,
                child: CircularButton(
                  elevation: 5,
                  color: Colors.green,
                  child: const Icon(
                    Icons.integration_instructions,
                    color: Colors.white,
                  ),
                  onTap: () {
                    controller.closeMenu(delay: true);
                  },
                ),
              ),
            ),
          ),
          GetBuilder<CircularMenuButtonController>(
            builder: (_) => Transform.translate(
              offset: Offset.fromDirection(controller.getRadiansFromDegree(325),
                  controller.buttonThreeAnimation.value * 120),
              child: Transform(
                transform: Matrix4.rotationZ(controller
                    .getRadiansFromDegree(controller.rotationAnimation.value))
                  ..scale(controller.buttonThreeAnimation.value),
                alignment: Alignment.center,
                child: CircularButton(
                  elevation: 5,
                  color: Colors.deepPurpleAccent,
                  child: const Icon(
                    Icons.settings,
                    color: Colors.white,
                  ),
                  onTap: () {
                    controller.closeMenu();
                  },
                ),
              ),
            ),
          ),
          GetBuilder<CircularMenuButtonController>(
            builder: (_) => RotationTransition(
              turns: Tween(begin: 0.0, end: 0.5)
                  .animate(controller.animationController),
              child: CircularButton(
                elevation: 5,
                color: controller.isOpen ? Colors.grey : Colors.red,
                child: controller.isOpen ? _closeIcon : _addIcon,
                onTap: controller.mainButtonAction,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
