import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketer/controller/products_list_controller.dart';
import 'package:marketer/data/models/invoice_item.dart';
import 'package:marketer/data/models/product.dart';
import 'package:marketer/utils/custom_dialogs.dart';

class InvoiceItemWidget extends StatelessWidget {
  InvoiceItemWidget(this.index, {required this.invoiceItem})
      : product = Get.find<ProductsListController>()
            .getProduct(invoiceItem.productId);

  final int index;
  final InvoiceItem invoiceItem;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Text('$index'),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: VerticalDivider(),
                ),
                GestureDetector(
                  onTap: () {
                    showProductInfoDialog(product);
                  },
                  child: Container(
                    width: 80,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      image: DecorationImage(
                        image: AssetImage('assets/photo.jpeg'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${product.name}',
                            style: const TextStyle(
                                fontSize: 16, fontFamily: 'Vazir'),
                          ),
                          Text(
                            '${invoiceItem.price} ريال',
                            style: const TextStyle(
                              fontFamily: 'VazirLight',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${invoiceItem.numberOrder}',
                            style: const TextStyle(
                              fontFamily: 'VazirLight',
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            '${product.boxPrice} ريال',
                            style: const TextStyle(
                              fontFamily: 'VazirLight',
                              fontSize: 12,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Divider(
          height: 0,
          indent: 20,
        ),
      ],
    );
  }
}
