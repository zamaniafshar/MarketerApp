import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketer/data/models/invoice.dart';
import 'package:marketer/ui/widgets/invoice_status_board.dart';
import 'package:marketer/ui/screens/invoice_screen.dart';

class InvoiceWidget extends StatelessWidget {
  const InvoiceWidget(this.invoice,
      {required this.index,
      this.showDivider = false,
      required this.customerName});
  final Invoice invoice;
  final String customerName;
  final int index;
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            Get.toNamed(InvoiceScreen.name);
          },
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: SizedBox(
              height: 70,
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                    child: Text(
                      '$index',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontFamily: 'VazirLight',
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.0),
                    child: VerticalDivider(
                      width: 0,
                      indent: 5,
                      endIndent: 5,
                    ),
                  ),
                  SizedBox(
                    width: 80,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'فاکتور فروش',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.blue,
                          ),
                        ),
                        Text(
                          '${invoice.id}',
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.blue,
                            fontFamily: 'VazirLight',
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('به $customerName'),
                            Text(
                              'تاریخ صدور: ${invoice.time}',
                              style: const TextStyle(
                                fontFamily: 'VazirLight',
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InvoiceStatusBoard(invoice.status),
                            Text(
                              '${invoice.totalPrice} ریال',
                              style: const TextStyle(
                                fontFamily: 'VazirLight',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        if (showDivider)
          Divider(
            height: 1,
          ),
      ],
    );
  }
}
