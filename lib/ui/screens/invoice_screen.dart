import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketer/controller/Invoice_items_list_controller.dart';
import 'package:marketer/ui/widgets/invoice_item_widget.dart';
import 'package:marketer/ui/widgets/invoice_status_board.dart';

const _outlinedBorderDecoration = BoxDecoration(
  color: Colors.white,
  border: const Border.symmetric(
    horizontal: BorderSide(
      color: Colors.black38,
      width: 0.2,
    ),
  ),
);

class InvoiceScreen extends StatelessWidget {
  static const name = 'InvoiceScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Colors.indigo,
            height: 130,
            padding: const EdgeInsets.all(8),
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () => Get.back(),
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                      const Text(
                        'فاکتور فروش',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontFamily: 'Vazir',
                        ),
                      ),
                      const Icon(
                        Icons.more_vert,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'تاریخ صدور: 1400/07/02',
                        style: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'VazirLight',
                        ),
                      ),
                      Text(
                        'شماره فاکتور: 581756',
                        style: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'VazirLight',
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                SizedBox(
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      primary: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      side: _outlinedBorderDecoration.border!.bottom,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'طرف حساب',
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                        Text(
                          'محسن گلستانی',
                          style: const TextStyle(
                            color: Colors.blue,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'آیتم های فاکتور',
                    textAlign: TextAlign.right,
                  ),
                ),
                Container(
                  decoration: _outlinedBorderDecoration,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemCount: 4,
                    itemBuilder: (context, index) => InvoiceItemWidget(
                      index + 1,
                      invoiceItem:
                          InvoiceItemsListController.invoiceItem[index],
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'انتهای فاکتور',
                    textAlign: TextAlign.right,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration: _outlinedBorderDecoration,
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 20,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('جمع کل'),
                          Text(
                            '2015498 ريال',
                            style: const TextStyle(
                              fontFamily: 'VazirLight',
                            ),
                          ),
                        ],
                      ),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('وضعیت فاکتور'),
                          InvoiceStatusBoard(1),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
