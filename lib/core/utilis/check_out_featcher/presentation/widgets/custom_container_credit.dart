import 'package:flutter/material.dart';
import 'package:payment_gateway_new/core/utilis/constant.dart';

class CustomContainerCredit extends StatelessWidget {
  const CustomContainerCredit({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 305,
      height: 80,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Image.asset('assets/logo.png'),
            wSizeBox,
            const Column(
              children: [
                Text(
                  'Credit Card ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
                Text(
                  'Mastercard **78 ',
                  style: TextStyle(
                    color: Colors.black38,
                    fontSize: 16,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
