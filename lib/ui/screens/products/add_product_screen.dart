import 'package:marketer/controller/products_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddProductScreen {
  static void show(BuildContext context) {
    final ProductsListController _productListController = Get.find();

    String name = '';
    int numberOfProduct = 0;
    double priceOfEach = 0;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        contentPadding: EdgeInsets.all(10),
        scrollable: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        title: const Text('اضافه کردن محصول'),
        actions: [
          TextButton(
            child: const Text('لغو'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          TextButton(
            child: const Text('ذخیره'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
        content: Column(
          children: [
            TextField(
              onChanged: (value) => name = value,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                hintText: 'نام کالا',
              ),
            ),
            TextField(
              onChanged: (value) => numberOfProduct = int.parse(value),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'تعداد',
              ),
            ),
            TextField(
              onChanged: (value) => priceOfEach = double.parse(value),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'فی واحد',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
