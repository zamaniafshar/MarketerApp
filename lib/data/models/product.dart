class ProductFields {
  static const id = 'id';
  static const numberInventory = 'number_product';
  static const numberEachBox = 'number_in_each_box';
  static const priceEachCustomer = 'price_each';
  static const priceEachConsumer = 'price_each';
  static const boxPrice = 'box_price';
  static const name = 'name';
  static const typeOfCounting = 'type_of_counting';
}

class Product {
  const Product({
    required this.id,
    required this.numberInventory,
    required this.numberEachBox,
    required this.priceEachSeller,
    required this.priceEachConsumer,
    required this.boxPrice,
    required this.name,
    required this.typeOfCounting,
  });

  final int id;
  final int numberInventory;
  final int numberEachBox;
  final String priceEachSeller;
  final String priceEachConsumer;
  final String boxPrice;
  final String name;
  final String typeOfCounting;

  Product.fromJson(Map<String, Object> json)
      : id = json[ProductFields.id] as int,
        numberInventory = json[ProductFields.numberInventory] as int,
        numberEachBox = json[ProductFields.numberEachBox] as int,
        priceEachSeller = json[ProductFields.priceEachCustomer] as String,
        priceEachConsumer = json[ProductFields.priceEachConsumer] as String,
        boxPrice = json[ProductFields.boxPrice] as String,
        name = json[ProductFields.name] as String,
        typeOfCounting = json[ProductFields.typeOfCounting] as String;
}
