import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:marketer/data/models/customer.dart';
import 'package:marketer/data/models/product.dart';

void showAlertDialog(final void Function() onConfirm) {
  Get.defaultDialog(
    title: 'ایا مطمعنید میخواهید این مشتری را حذف کنید؟',
    middleText: '',
    textConfirm: 'بله',
    confirmTextColor: Colors.white,
    onConfirm: onConfirm,
  );
}

void showProductInfoDialog(final Product product) {
  Get.dialog(
    AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      title: UnconstrainedBox(
        child: Container(
          height: 150,
          width: 150,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            image: DecorationImage(
              image: AssetImage('assets/photo.jpeg'),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ListTile(
            leading: Text('نام:'),
            trailing: Text(product.name),
          ),
          ListTile(
            leading: Text('قیمت هر ${product.typeOfCounting}:'),
            trailing: Text('${product.boxPrice} ريال'),
          ),
          ListTile(
            leading: Text('قیمت فروشنده:'),
            trailing: Text('${product.priceEachSeller} ريال'),
          ),
          ListTile(
            leading: Text('قیمت خریدار:'),
            trailing: Text('${product.priceEachConsumer} ريال'),
          ),
          ListTile(
            leading: Text('موجودی:'),
            trailing:
                Text('${product.numberInventory} ${product.typeOfCounting}'),
          ),
          ListTile(
            leading: Text('در هر بکس:'),
            trailing: Text('${product.numberEachBox}'),
          ),
          ListTile(
            leading: Text('نوع شمارش:'),
            trailing: Text('${product.typeOfCounting}'),
          ),
        ],
      ),
    ),
    barrierDismissible: true,
    transitionCurve: Curves.bounceInOut,
  );
}

void showCustomerInfo(final Customer customer) {
  Get.defaultDialog(
    title: 'مشخصات',
    content: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('نام: ${customer.name}'),
          Text(
            'شماره تلفن: ${customer.phoneNumber}',
            style: const TextStyle(fontFamily: 'VazirLight'),
          ),
          Text('استان: ${customer.province}'),
          Text('شهر: ${customer.city}'),
          Text('آدرس: ${customer.address}'),
        ],
      ),
    ),
  );
}
