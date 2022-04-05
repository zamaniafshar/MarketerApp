import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:marketer/controller/customers/customers_list_controller.dart';
import 'package:marketer/data/services/calls_and_messages_service.dart';
import 'package:marketer/data/models/customer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketer/ui/screens/customers/add_or_edit_customer_screen.dart';
import 'package:marketer/ui/screens/customers/customer_profile_screen.dart';
import 'package:marketer/ui/widgets/circular_button.dart';

class CustomerWidget extends StatelessWidget {
  const CustomerWidget(this.customer, {this.showDivider = false});

  final Customer customer;
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Slidable(
          actionExtentRatio: 0.25,
          actionPane: const SlidableScrollActionPane(),
          actions: [
            IconSlideAction(
              caption: 'تماس',
              iconWidget: const CircularButton(
                padding: EdgeInsets.all(8.0),
                color: Color(0xFFD9F1DA),
                child: Icon(
                  Icons.call,
                  color: Colors.green,
                ),
              ),
              onTap: () {
                call(customer.phoneNumber);
              },
            ),
            IconSlideAction(
              caption: 'پیامک',
              iconWidget: const CircularButton(
                padding: const EdgeInsets.all(8.0),
                color: Color(0xFFE4DBFD),
                child: Icon(
                  Icons.message,
                  color: Color(0xFF8F66FF),
                ),
              ),
              onTap: () {
                sendSms(customer.phoneNumber);
              },
            ),
            IconSlideAction(
              caption: 'ویرایش',
              iconWidget: const CircularButton(
                padding: const EdgeInsets.all(8.0),
                color: Color(0xFFD5F7FC),
                child: Icon(
                  Icons.edit,
                  color: Colors.cyan,
                ),
              ),
              onTap: () {
                Get.toNamed(AddOrEditCustomerScreen.name, arguments: customer);
              },
            ),
            IconSlideAction(
              caption: 'حذف',
              iconWidget: const CircularButton(
                padding: const EdgeInsets.all(8.0),
                color: Color(0xFFFAD6E2),
                child: Icon(
                  Icons.delete,
                  color: Colors.pink,
                ),
              ),
              onTap: () {
                Get.find<CustomersListController>()
                    .deleteCustomer(customer.id!);
              },
            ),
          ],
          child: GestureDetector(
            onTap: () {
              Get.toNamed(CustomerProfileScreen.name, arguments: customer);
            },
            child: Material(
              color: Colors.white,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                child: Row(
                  children: [
                    const CircleAvatar(
                      backgroundColor: Colors.blueAccent,
                      radius: 30,
                      child: Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: SizedBox(
                        height: 60,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  customer.name,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                Text(
                                  'بدهی : ${customer.balance} ریال',
                                  style: const TextStyle(
                                    color: Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${customer.province} ${customer.city}',
                                  style: const TextStyle(),
                                ),
                                Text(
                                  '1400/6/18',
                                  style: const TextStyle(
                                    fontSize: 15,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'VazirLight',
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        if (showDivider)
          const Divider(
            height: 1,
            indent: 70,
          ),
      ],
    );
  }
}
