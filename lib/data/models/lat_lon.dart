class LatLonFields {
  static const lat = 'lat';
  static const lon = 'lon';
}

class LatLon {
  const LatLon({
    required this.lat,
    required this.lon,
  });

  final double lat;
  final double lon;

  LatLon.fromJson(Map<String, double> json)
      : lat = json[LatLonFields.lat] as double,
        lon = json[LatLonFields.lon] as double;

  Map<String, double> toJson() => {
        LatLonFields.lat: lat,
        LatLonFields.lon: lon,
      };
}
