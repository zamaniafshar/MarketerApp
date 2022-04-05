import 'package:flutter/cupertino.dart';

class CustomFieldsController {
  CustomFieldsController(
      {Map<String, String? Function(String?)>? validators,
      Map<String, void Function(String?)>? savers})
      : formkey = GlobalKey<FormState>(),
        _savers = savers,
        _validators = validators;

  final GlobalKey<FormState> formkey;
  final Map<String, String? Function(String?)>? _validators;
  final Map<String, void Function(String?)>? _savers;

  String? Function(String?) validators(String key) => _validators![key]!;
  void Function(String?) savers(String key) => _savers![key]!;

  bool checkFileds() {
    if (formkey.currentState!.validate()) {
      formkey.currentState!.save();
      return true;
    }
    return false;
  }
}
