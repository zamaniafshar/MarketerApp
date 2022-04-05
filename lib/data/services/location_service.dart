import 'package:geolocator/geolocator.dart';
import 'package:marketer/data/models/lat_lon.dart';

class LocationService {
  static Future<LatLon> getLocation() async {
    final Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.best,
    );
    final LatLon locationInfo =
        LatLon(lat: position.latitude, lon: position.longitude);

    return locationInfo;
  }
}
