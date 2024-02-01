import 'package:flutter/material.dart';

Container buildSpacer() {
  return Container(
    width: 320,
    decoration: const ShapeDecoration(
      shape: RoundedRectangleBorder(
        side: BorderSide(
          width: 2,
          strokeAlign: BorderSide.strokeAlignCenter,
          color: Color(0xFFC6C6C6),
        ),
      ),
    ),
  );
}
