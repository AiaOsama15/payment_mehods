import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomQrRow extends StatelessWidget {
  const CustomQrRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Icon(FontAwesomeIcons.barcode, size: 60),
        Container(
          alignment: Alignment.center,
          width: 113,
          height: 58,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: const BorderSide(
                width: 1.50,
                color: Color(0xFF34A853),
              ),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          child: const Text(
            'PAID',
            style: TextStyle(
              color: Color(0xFF34A853),
              fontSize: 24,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
              height: 0,
            ),
          ),
        )
      ],
    );
  }
}
