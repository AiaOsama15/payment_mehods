// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:payment_gateway_new/core/utilis/constant.dart';

// ignore: must_be_immutable
class PaymentItemsDetails extends StatefulWidget {
  const PaymentItemsDetails({
    super.key,
  });

  @override
  State<PaymentItemsDetails> createState() => _PaymentItemsDetailsState();
}

class _PaymentItemsDetailsState extends State<PaymentItemsDetails> {
  List<String> listPaymentImage = [
    'assets/credit.png',
    'assets/paypal.png',
    'assets/applepay.png'
  ];
  bool isActive = false;

  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: listPaymentImage.length,
          separatorBuilder: (BuildContext context, int index) {
            return wSizeBox25;
          },
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                setState(() {});
                isActive = selectedIndex == index;
                // isActive = true;
              },
              child: buildImageContainer(listPaymentImage[index], isActive),
            );
          }),
    );
  }
}

buildImageContainer(String imageName, bool isActive) {
  //  [bool? isActive]
  // isActive ?? false
  // bool isActive = false;
  return AnimatedContainer(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(6),
      border:
          Border.all(color: isActive ? Colors.green : Colors.grey, width: 2.0),
    ),
    height: 62,
    width: 104,
    duration: const Duration(milliseconds: 300),
    child: Image.asset(imageName),
  );
}
