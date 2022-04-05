import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketer/controller/product_widgets_controller.dart';
import 'package:marketer/utils/custom_icons.dart';
import 'package:marketer/data/models/product.dart';

class ProductWidget extends StatelessWidget {
  final Product product;
  final PageController pageController;
  final void Function(String tag) onTap;
  final String tag;

  ProductWidget({
    required this.product,
    required this.pageController,
    required this.onTap,
    required this.tag,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
            child: PageView(
              reverse: true,
              controller: pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                _Page1(product: product),
                _Page2(product: product),
              ],
            ),
          ),
          _ArrowButton(
            onTap: onTap,
            tag: tag,
          ),
        ],
      ),
    );
  }
}

class _Page2 extends StatelessWidget {
  final Product product;

  const _Page2({
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _SquareWidget(
              title: 'مصرف کننده:',
              text: '${product.priceEachConsumer} تومان',
              color: Colors.blueAccent,
            ),
            _SquareWidget(
              title: 'فروشنده:',
              text: '${product.priceEachSeller} تومان',
              color: Colors.blueAccent,
            ),
          ],
        ),
        Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _SquareWidget(
              title: 'نوع شمارش:',
              text: '${product.typeOfCounting}',
              color: Colors.green,
              width: 80,
            ),
            _SquareWidget(
              title: 'ایدی:',
              text: product.id.toString(),
              color: Colors.green,
              width: 80,
            ),
          ],
        ),
        Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 15,
            ),
            _SquareWidget(
              title: 'تعداد ${product.typeOfCounting}:',
              text: product.numberEachBox.toString(),
              color: Colors.orange,
              width: 80,
            ),
          ],
        ),
      ],
    );
  }
}

class _Page1 extends StatelessWidget {
  final Product product;

  const _Page1({
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _ProductImage(numberInventory: product.numberInventory),
        _ProductDetails(
          name: product.name,
          boxPrice: product.boxPrice,
        ),
      ],
    );
  }
}

class _SquareWidget extends StatelessWidget {
  final String title;
  final String text;
  final Color color;
  final double? width;

  const _SquareWidget({
    required this.title,
    required this.text,
    this.width,
    this.color = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15),
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 13,
            ),
          ),
          Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: 'VazirLight',
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class _ArrowButton extends StatelessWidget {
  final void Function(String tag) onTap;
  final String tag;
  final AnimationController animationController;

  _ArrowButton({
    required this.onTap,
    required this.tag,
  }) : animationController = Get.find<ProductWidgetsController>(
          tag: tag.toString(),
        ).animationController;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.red,
          shape: BoxShape.circle,
        ),
        child: IconButton(
          splashRadius: 15,
          color: Colors.white,
          icon: RotationTransition(
            turns: Tween(begin: 0.0, end: 0.5).animate(animationController),
            child: const Icon(Icons.arrow_forward_ios),
          ),
          onPressed: () {
            onTap(tag);
          },
        ),
      ),
    );
  }
}

class _ProductDetails extends StatelessWidget {
  final String name;
  final String boxPrice;
  const _ProductDetails({
    required this.name,
    required this.boxPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(
              CustomIcons.product2,
              color: Colors.green,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              name,
              style: const TextStyle(
                fontFamily: 'Vazir',
              ),
            ),
          ],
        ),
        Row(
          children: [
            const Icon(
              CustomIcons.money,
              color: Colors.orange,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              '$boxPrice تومان',
              style: const TextStyle(
                fontFamily: 'VazirLight',
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _ProductImage extends StatelessWidget {
  final int numberInventory;
  const _ProductImage({
    required this.numberInventory,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: 130,
      margin: const EdgeInsets.only(bottom: 10, left: 10),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/photo.jpeg'),
          fit: BoxFit.fill,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Align(
        alignment: Alignment.bottomRight,
        child: CircleAvatar(
          radius: 17,
          child: Text(
            '$numberInventory',
            style: const TextStyle(
              fontFamily: 'VazirLight',
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }
}
