
import 'package:flutter/material.dart';
import 'package:payment_gateway_new/core/utilis/style.dart';

customAppBar(String title, onPressed) {
  void Function()? onPressed;
  return AppBar(
    centerTitle: true,
    leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.black,
          size: 29,
        ),
        onPressed: onPressed),
    title: Text(
      title,
      // textAlign: TextAlign.center,
      style: Style.textStyle25,
    ),
    
  );
}
