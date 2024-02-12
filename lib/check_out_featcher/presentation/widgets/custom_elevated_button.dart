
import 'package:flutter/material.dart';
import 'package:payment_gateway_new/core/utilis/style.dart';

// ignore: must_be_immutable
class CustomElevateButton extends StatelessWidget {
  String? textOfButton;
     Function() ?onPressed;
  CustomElevateButton({super.key, required this.textOfButton,
 required this.onPressed
     });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed ,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        backgroundColor: Colors.green,
        padding: const EdgeInsets.symmetric(
          vertical: 16,
        ),
      ),
      child: Text(
        textOfButton!,
        style: Style.textStyle22,
      ),
    );
  }
}
