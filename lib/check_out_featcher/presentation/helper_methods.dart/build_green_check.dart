
import 'package:flutter/material.dart';
import 'package:payment_gateway_new/check_out_featcher/presentation/widgets/thank_you_body.dart';

CircleAvatar buildGreenCheck() {
   
    return CircleAvatar(
            backgroundColor: Color(geryColor),
            radius: 50,
            child: const CircleAvatar(
              radius: 40,
              backgroundColor: Colors.green,
              child: Icon(
                Icons.check,
                size: 42,
                color: Colors.white,
              ),
            ),
          );
  }
