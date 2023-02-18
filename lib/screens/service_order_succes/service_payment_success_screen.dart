import 'package:riders_app/screens/service_order_succes/components/payment_body.dart';
import 'package:flutter/material.dart';

import 'components/body.dart';

class ServicePaymentSuccessScreen extends StatelessWidget {
  static String routeName = "/complete_payment";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leading: SizedBox(),
      // ),
      body: PaymentBody(),
    );
  }
}
