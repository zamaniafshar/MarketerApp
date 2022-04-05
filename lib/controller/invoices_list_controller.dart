import 'package:marketer/data/models/invoice.dart';
import 'package:get/get.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class InvoicesListController extends GetxController {
  List<Invoice> invoicesList = [];
  List<Invoice> todayInvoicesList = [];
  List<Invoice> previousInvoicesList = [];

  @override
  void onInit() {
    readInvoices();
    super.onInit();
  }

  void readInvoices() async {
    invoicesList = [
      Invoice(
        id: 576891,
        customerId: 1,
        time: DateTime.now().toPersianDate(twoDigits: true).toString(),
        status: 0,
        balance: 0,
        totalPrice: 205601,
      ),
      Invoice(
        id: 335789,
        customerId: 3,
        time: '1400/05/02',
        status: 0,
        balance: 0,
        totalPrice: 205601,
      ),
      Invoice(
        id: 789654,
        customerId: 1,
        time: DateTime.now().toPersianDate(twoDigits: true).toString(),
        status: 0,
        balance: 0,
        totalPrice: 205601,
      ),
      Invoice(
        id: 123654,
        customerId: 1,
        time: '1400/05/02',
        status: 0,
        balance: 0,
        totalPrice: 205601,
      ),
      Invoice(
        id: 258741,
        customerId: 1,
        time: '1400/05/02',
        status: 0,
        balance: 0,
        totalPrice: 205601,
      ),
      Invoice(
        id: 951357,
        customerId: 1,
        time: '1400/05/02',
        status: 0,
        balance: 0,
        totalPrice: 205601,
      ),
      Invoice(
        id: 1,
        customerId: 1,
        time: '1400/05/02',
        status: 0,
        balance: 0,
        totalPrice: 205601,
      ),
      Invoice(
        id: 1,
        customerId: 1,
        time: '1400/05/02',
        status: 0,
        balance: 0,
        totalPrice: 205601,
      ),
      Invoice(
        id: 1,
        customerId: 1,
        time: '1400/05/02',
        status: 0,
        balance: 0,
        totalPrice: 205601,
      ),
      Invoice(
        id: 1,
        customerId: 1,
        time: '1400/05/02',
        status: 0,
        balance: 0,
        totalPrice: 205601,
      ),
    ];
    final date = DateTime.now().toPersianDate(twoDigits: true);

    invoicesList.forEach((invoice) {
      if (invoice.time == date)
        todayInvoicesList.add(invoice);
      else
        previousInvoicesList.add(invoice);
    });
  }

  Future<int> createInvoice({required Invoice invoice}) async {
    // TODO: req server and ...

    return 0;
  }
}
