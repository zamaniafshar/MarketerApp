import 'package:marketer/data/models/product.dart';
import 'package:get/get.dart';

class ProductsListController extends GetxController {
  @override
  void onInit() {
    readProducts();
    super.onInit();
  }

  List<Product> _productsList = [];

  List<Product> get productList => _productsList;

  Product getProduct(int id) {
    return _productsList.firstWhere((product) => product.id == id);
  }

  void readProducts() async {
    // TODO: fix here too
    _productsList = [
      Product(
        id: 100101,
        numberInventory: 20,
        numberEachBox: 6,
        priceEachSeller: '15000',
        priceEachConsumer: '17000',
        boxPrice: '90000',
        name: 'دوغ 1 نیم لیتری',
        typeOfCounting: 'بکس',
      ),
      Product(
        id: 100102,
        numberInventory: 20,
        numberEachBox: 6,
        priceEachSeller: '1500000',
        priceEachConsumer: '1700000',
        boxPrice: '9000000',
        name: 'دوغ 1 نیم لیتری',
        typeOfCounting: 'بکس',
      ),
      Product(
        id: 100102,
        numberInventory: 20,
        numberEachBox: 6,
        priceEachSeller: '1500000',
        priceEachConsumer: '17000',
        boxPrice: '90000',
        name: 'دوغ 1 نیم لیتری',
        typeOfCounting: 'بکس',
      ),
    ];
  }
}
