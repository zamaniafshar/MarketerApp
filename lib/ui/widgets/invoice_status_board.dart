import 'package:flutter/material.dart';
import 'package:marketer/utils/constants.dart';

class InvoiceStatusBoard extends StatelessWidget {
  const InvoiceStatusBoard(
    this._status, {
    this.height = 30,
    this.width = 80,
  });

  final int _status;
  final double height;
  final double width;

  Widget get _getStatusWidget {
    String statusText = 'error';
    Color color = Colors.white;
    switch (_status) {
      case kInvoiceStatus_paid:
        statusText = 'تسویه شده';
        color = Colors.green;
        break;
      case kInvoiceStatus_unpaid:
        statusText = 'تسویه نشده';
        color = Colors.yellow.shade700;
        break;
      case kInvoiceStatus_canceled:
        statusText = 'برگشت شده';
        color = Colors.red;
        break;
    }
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Center(
          child: Text(
        statusText,
        style: const TextStyle(color: Colors.white),
      )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _getStatusWidget;
  }
}
