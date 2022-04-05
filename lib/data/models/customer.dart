import 'package:marketer/data/models/lat_lon.dart';

class CustomerFields {
  static const id = 'id';
  static const balance = 'balance';
  static const name = 'name';
  static const phoneNumber = 'phone_number';
  static const address = 'address';
  static const province = 'province';
  static const city = 'city';
  static const latLon = 'latLon';
}

class Customer {
  const Customer({
    this.id,
    this.balance = 0.0,
    required this.name,
    required this.phoneNumber,
    required this.address,
    required this.province,
    required this.city,
    required this.latLon,
  });

  final int? id;
  final double balance;
  final String name;
  final String phoneNumber;
  final String address;
  final String province;
  final String city;
  final LatLon latLon;

  Customer copy({
    int? id,
    double? balance,
    String? name,
    String? phoneNumber,
    String? address,
    String? province,
    String? city,
    LatLon? latLon,
  }) =>
      Customer(
        id: id ?? this.id,
        balance: balance ?? this.balance,
        name: name ?? this.name,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        address: address ?? this.address,
        province: province ?? this.province,
        city: city ?? this.city,
        latLon: latLon ?? this.latLon,
      );

  Map<String, Object> toJson() => {
        CustomerFields.id: id as int,
        CustomerFields.name: name,
        CustomerFields.balance: balance,
        CustomerFields.phoneNumber: phoneNumber,
        CustomerFields.address: address,
        CustomerFields.province: province,
        CustomerFields.city: city,
        CustomerFields.latLon: latLon.toJson(),
      };

  Customer.fromJson(Map<String, Object> json)
      : id = json[CustomerFields.id] as int,
        balance = json[CustomerFields.balance] as double,
        name = json[CustomerFields.name] as String,
        phoneNumber = json[CustomerFields.phoneNumber] as String,
        address = json[CustomerFields.address] as String,
        province = json[CustomerFields.province] as String,
        city = json[CustomerFields.city] as String,
        latLon =
            LatLon.fromJson(json[CustomerFields.latLon] as Map<String, double>);
}
