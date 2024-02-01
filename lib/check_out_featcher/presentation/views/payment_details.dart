
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:payment_gateway_new/check_out_featcher/presentation/helper_methods.dart/build_app_bar.dart';
import 'package:payment_gateway_new/core/utilis/constant.dart';

class PaymentDetails extends StatefulWidget {
  const PaymentDetails({super.key});

  @override
  State<PaymentDetails> createState() => _PaymentDetailsState();
}

class _PaymentDetailsState extends State<PaymentDetails> {
  bool isActive = false;
  // bool isActive2 = false;
  // bool isActive3 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('Payment Details', () {}),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: CustomScrollView(
          slivers: <Widget>[
          
          
            hSizeBox,
          ],
        ),
      ),
    );
  }
}
