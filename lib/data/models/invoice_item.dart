class InvoiceItemFields {}

class InvoiceItem {
  final int? id;
  final double price;
  final int numberOrder;
  final int productId;
  InvoiceItem({
    this.id,
    required this.price,
    required this.numberOrder,
    required this.productId,
  });

  InvoiceItem copyWith({
    int? id,
    double? price,
    int? number,
    int? productId,
  }) {
    return InvoiceItem(
      id: id ?? this.id,
      price: price ?? this.price,
      numberOrder: number ?? this.numberOrder,
      productId: productId ?? this.productId,
    );
  }
}
