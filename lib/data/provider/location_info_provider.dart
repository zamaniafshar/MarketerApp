import 'package:dio/dio.dart';
import 'package:marketer/data/models/lat_lon.dart';
import 'package:marketer/data/provider/base_provider.dart';

const _apikey =
    'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjNkNjc5MDRmOWU2MTMyNjc4NTkzNWJiOWFkZjFlNWViNjBjYjkzYjllZmFiZjkyZTcyODhiZThmZTVmYjgzNjYyYzMzNDI5NjBkZTY4MWIxIn0.eyJhdWQiOiIxNTI3NCIsImp0aSI6IjNkNjc5MDRmOWU2MTMyNjc4NTkzNWJiOWFkZjFlNWViNjBjYjkzYjllZmFiZjkyZTcyODhiZThmZTVmYjgzNjYyYzMzNDI5NjBkZTY4MWIxIiwiaWF0IjoxNjI5OTU2ODc1LCJuYmYiOjE2Mjk5NTY4NzUsImV4cCI6MTYzMjYzODg3NSwic3ViIjoiIiwic2NvcGVzIjpbImJhc2ljIl19.hvAO1BdKYb31lBNhXPVWu3iEAGVPKgjEM9YE0__CiAf1t23_zyBTOJjTcQS5YFlG--Pu4UjhpYAqJQOA0yayk6GUp05N5ChMArZdUbmMokMhAumNBTl_y0AXwEWauxEfapPbKXT854zkRXQY55iLZ-kxCtQuTKAlMEr6IJZPvyrxe5tUXOuRBVMafGdl5LidncQ0GgBC4QxQhhB_a_7kkTjYziNAYTl4OoHL2wrParuIdVI3dPJNLWiEZrC9zjihnPdv_Nds4p129-D_X5_CF6y-3HEAIni7ALn_sRfd3tqQNPWoJzlX5_1xSbR9L3aRDB5X7-kII3Gh4K4Vck3EHQ';
const _baseUrl = 'https://map.ir/reverse?';
const _headers = {'x-api-key': _apikey};
final _option = Options(
  headers: _headers,
);

Future<dynamic> getLocationInfo({
  required final LatLon latLon,
}) async {
  final url = _baseUrl + 'lat=${latLon.lat}&lon=${latLon.lon}';
  return (await get(url, options: _option)).data;
}
