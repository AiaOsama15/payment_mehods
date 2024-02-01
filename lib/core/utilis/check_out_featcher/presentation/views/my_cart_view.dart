import 'package:flutter/material.dart';
import 'package:payment_gateway_new/check_out_featcher/presentation/helper_methods.dart/build_app_bar.dart';
import 'package:payment_gateway_new/check_out_featcher/presentation/widgets/cart_items.dart';
import 'package:payment_gateway_new/check_out_featcher/presentation/widgets/custom_elevated_button.dart';
import 'package:payment_gateway_new/core/utilis/constant.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('My Cart', () {}),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 11),
        child: SingleChildScrollView(
          child: Column(children: [
            hSizeBox,
            const CartItems(),
            vhSizeBox,
            Row(children: [
              Expanded(
                child: CustomElevateButton(
                  textOfButton: 'Complete Payment',
                ),
              ),
            ]),
          ]),
        ),
      ),
    );
  }
}
