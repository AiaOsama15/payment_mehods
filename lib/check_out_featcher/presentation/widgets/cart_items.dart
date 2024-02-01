
import 'package:flutter/material.dart';
import 'package:payment_gateway_new/check_out_featcher/presentation/helper_methods.dart/build_text_row.dart';
import 'package:payment_gateway_new/core/utilis/constant.dart';
import 'package:payment_gateway_new/core/utilis/style.dart';

class CartItems extends StatelessWidget {
  const CartItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        height: 444,
        width: 350,
        child: Container(
          height: 424,
          width: 277,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/cart.png"),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
      hSizeBox,
      customTextRow('Order Subtotal', Style.textStyle18, '45.0'),
      hSizeBox,
      customTextRow('Discount', Style.textStyle18, '4'),
      hSizeBox,
      customTextRow('Shipping', Style.textStyle18, '8'),
      hSizeBox,
      const Divider(
        color: Colors.black,
        thickness: 2.0,
      ),
      hSizeBox,
      customTextRow('Total', Style.textStyle25, '8'),
     vhSizeBox
    ]);
  }
}
