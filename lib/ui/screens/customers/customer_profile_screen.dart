import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketer/controller/customers/customer_profile_controller.dart';
import 'package:marketer/controller/invoices_list_controller.dart';
import 'package:marketer/data/services/calls_and_messages_service.dart';
import 'package:marketer/ui/widgets/Invoices/Invoice_widget.dart';
import 'package:marketer/ui/widgets/squre_icon_button.dart';
import 'package:marketer/utils/custom_dialogs.dart';
import 'package:marketer/utils/custom_snack_bars.dart';

class CustomerProfileScreen extends StatelessWidget {
  static const name = 'CustomerProfileScreen';

  final InvoicesListController _invoicesListController = Get.find();
  final CustomerProfileController _controller = Get.find();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  Column _buildBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        GetBuilder<CustomerProfileController>(
          builder: (_) => Text(
            '${_controller.customer.name}',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Text(
          '${_invoicesListController.invoicesList.length} فاکتور',
          textAlign: TextAlign.center,
          style: const TextStyle(fontFamily: 'VazirLight'),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: SqureIconButton(
                caption: 'تماس',
                captionStyle: const TextStyle(color: Colors.green),
                color: const Color(0xFFD9F1DA),
                icon: const Icon(
                  Icons.call,
                  color: Colors.green,
                ),
                onTap: () {
                  call(_controller.customer.phoneNumber);
                },
              ),
            ),
            Expanded(
              child: SqureIconButton(
                caption: 'پیامک',
                captionStyle: const TextStyle(color: Color(0xFF8F66FF)),
                color: const Color(0xFFE4DBFD),
                icon: const Icon(
                  Icons.message,
                  color: Color(0xFF8F66FF),
                ),
                onTap: () {
                  sendSms(_controller.customer.phoneNumber);
                },
              ),
            ),
            Expanded(
              child: SqureIconButton(
                caption: 'اطلاعات',
                captionStyle: const TextStyle(color: Colors.cyan),
                color: const Color(0xFFD5F7FC),
                icon: const Icon(
                  Icons.info,
                  color: Colors.cyan,
                ),
                onTap: () {
                  showCustomerInfo(_controller.customer);
                },
              ),
            ),
            Expanded(
              child: SqureIconButton(
                caption: 'در نقشه',
                captionStyle: const TextStyle(color: Colors.pink),
                color: const Color(0xFFFAD6E2),
                icon: const Icon(
                  Icons.location_on,
                  color: Colors.pink,
                ),
                onTap: () {},
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Expanded(
          child: DefaultTabController(
            length: 3,
            child: Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    // scaffold background color
                    color: Color(0xfffafafa),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 2),
                        color: Colors.black12,
                        blurRadius: 2,
                      ),
                    ],
                  ),
                  child: const TabBar(
                    indicatorColor: Colors.blue,
                    labelColor: Colors.blue,
                    unselectedLabelColor: Colors.black54,
                    tabs: <Widget>[
                      Tab(icon: Text('همه')),
                      Tab(icon: Text('امروز')),
                      Tab(icon: Text('قبل')),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      ListView.builder(
                        key: const PageStorageKey(1),
                        itemCount: _invoicesListController.invoicesList.length,
                        itemBuilder: (context, index) => InvoiceWidget(
                          _invoicesListController.invoicesList[index],
                          index: index + 1,
                          customerName: _controller.customer.name,
                          showDivider:
                              _invoicesListController.invoicesList.length - 1 !=
                                  index,
                        ),
                      ),
                      ListView.builder(
                        key: const PageStorageKey(2),
                        itemCount:
                            _invoicesListController.todayInvoicesList.length,
                        itemBuilder: (context, index) => InvoiceWidget(
                          _invoicesListController.todayInvoicesList[index],
                          index: index + 1,
                          customerName: _controller.customer.name,
                          showDivider:
                              _invoicesListController.todayInvoicesList.length -
                                      1 !=
                                  index,
                        ),
                      ),
                      ListView.builder(
                        key: const PageStorageKey(3),
                        itemCount:
                            _invoicesListController.previousInvoicesList.length,
                        itemBuilder: (context, index) => InvoiceWidget(
                          _invoicesListController.previousInvoicesList[index],
                          index: index + 1,
                          customerName: _controller.customer.name,
                          showDivider: _invoicesListController
                                      .previousInvoicesList.length -
                                  1 !=
                              index,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.indigo,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(10))),
      title: const Text('پروفایل'),
      centerTitle: true,
      actions: [
        PopupMenuButton(
          icon: const Icon(Icons.more_vert),
          iconSize: 30,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5))),
          itemBuilder: (context) => [
            PopupMenuItem(
              value: 0,
              child: Row(
                children: [
                  const Icon(
                    Icons.edit,
                    color: Colors.black45,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Text('ویرایش'),
                ],
              ),
            ),
            PopupMenuItem(
              value: 1,
              child: Row(
                children: [
                  const Icon(
                    Icons.delete,
                    color: Colors.black45,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Text('حذف'),
                ],
              ),
            ),
          ],
          onSelected: (value) {
            switch (value) {
              case 0:
                _controller.editCustomer();
                break;
              case 1:
                showAlertDialog(() {
                  _controller.deleteCustomer();
                  Get.back();
                  Get.back();
                });
                break;
            }
          },
        ),
      ],
    );
  }
}
