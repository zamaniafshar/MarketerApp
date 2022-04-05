import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:marketer/bindings/add_or_edit_customer_screen_binding.dart';
import 'package:marketer/bindings/customer_profile_screen_binding.dart';
import 'package:marketer/bindings/customer_search_screen_binding.dart';
import 'package:marketer/bindings/initial_binding.dart';
import 'package:marketer/ui/screens/customers/add_or_edit_customer_screen.dart';
import 'package:marketer/ui/screens/customers/customer_profile_screen.dart';
import 'package:marketer/ui/screens/customers/customer_search_screen.dart';
import 'package:marketer/ui/screens/invoice_screen.dart';
import 'package:marketer/ui/screens/main_screen.dart';
import 'package:responsive_framework/responsive_framework.dart';

class MarketerApp extends StatelessWidget {
  const MarketerApp();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('fa', 'IR'),
      ],
      locale: Locale('fa', 'IR'),
      builder: _builder,
      theme: ThemeData(
        appBarTheme:
            AppBarTheme(systemOverlayStyle: SystemUiOverlayStyle.light),
      ),
      initialBinding: InitialBinding(),
      getPages: [
        GetPage(name: MainScreen.name, page: () => const MainScreen()),
        GetPage(
          name: AddOrEditCustomerScreen.name,
          page: () => AddOrEditCustomerScreen(),
          binding: AddOrEditCustomerScreenBinding(),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: CustomerSearchScreen.name,
          page: () => CustomerSearchScreen(),
          binding: CustomerSerachScreenBinding(),
          transition: Transition.noTransition,
        ),
        GetPage(
          name: CustomerProfileScreen.name,
          page: () => CustomerProfileScreen(),
          binding: CustomerProfileScreenBinding(),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: InvoiceScreen.name,
          page: () => InvoiceScreen(),
          transition: Transition.rightToLeft,
        ),
      ],
      initialRoute: MainScreen.name,
    );
  }

  Widget _builder(BuildContext context, Widget? child) {
    return ResponsiveWrapper.builder(
      MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: ScrollConfiguration(
          behavior: MyBehavior(),
          child: child!,
        ),
      ),
      maxWidth: 800,
      minWidth: 360,
      defaultScale: true,
      breakpoints: [
        ResponsiveBreakpoint.resize(480, name: MOBILE),
        ResponsiveBreakpoint.autoScale(800, name: TABLET),
        ResponsiveBreakpoint.resize(1000, name: DESKTOP),
      ],
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(context, child, axis) {
    return child;
  }
}
