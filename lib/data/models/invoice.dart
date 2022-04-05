class InvoiceFields {
  static const id = 'id';
  static const customerId = 'customer_id';
  static const status = 'status';
  static const time = 'time';
  static const balance = 'balance';
  static const totalPrice = 'total_price';
}

class Invoice {
  const Invoice({
    this.id,
    required this.customerId,
    required this.time,
    required this.status,
    required this.totalPrice,
    this.balance = 0,
  });

  final int? id;
  final int customerId;
  final int status;

  final String time;
  final double balance;
  final double totalPrice;

  Invoice.fromJson(Map<String, Object> json)
      : id = json[InvoiceFields.id] as int,
        customerId = json[InvoiceFields.customerId] as int,
        status = json[InvoiceFields.status] as int,
        balance = json[InvoiceFields.balance] as double,
        totalPrice = json[InvoiceFields.totalPrice] as double,
        time = json[InvoiceFields.time] as String;

  Map<String, Object> toJson() => {
        InvoiceFields.id: id as int,
        InvoiceFields.customerId: customerId,
        InvoiceFields.status: status,
        InvoiceFields.time: time,
        InvoiceFields.balance: balance,
        InvoiceFields.totalPrice: totalPrice,
      };

  Invoice copy({
    int? id,
    int? customerId,
    String? customerName,
    int? status,
    double? balance,
    double? price,
    String? time,
  }) =>
      Invoice(
        id: id ?? this.id,
        customerId: customerId ?? this.customerId,
        status: status ?? this.status,
        balance: balance ?? this.balance,
        totalPrice: price ?? this.totalPrice,
        time: time ?? this.time,
      );
}
