
import 'package:flutter/material.dart';
import 'package:payment_gateway_new/check_out_featcher/presentation/views/payment_details.dart';
import 'package:payment_gateway_new/core/utilis/style.dart';

customAppBar(String title,context) {
  
  return AppBar(
    centerTitle: true,
    leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.black,
          size: 29,
        ),
        onPressed: ( ){
          Navigator.pop(
            context,MaterialPageRoute(
                          builder: (context) => const PaymentDetails(),),);
                  
        }),
    title: Text(
      title,
      // textAlign: TextAlign.center,
      style: Style.textStyle25,
    ),
    
  );
}
