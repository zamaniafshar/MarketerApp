// import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:url_launcher/url_launcher.dart';

void call(String number) async {
  // await FlutterPhoneDirectCaller.callNumber(number);
  // TODO:fix here
}

void sendSms(String number) async {
  await launch('sms:$number');
}
