import 'package:flutter/material.dart';
import 'package:payment_gateway_new/check_out_featcher/presentation/views/my_cart_view.dart';
import 'package:payment_gateway_new/check_out_featcher/presentation/views/payment_details.dart';
import 'package:payment_gateway_new/check_out_featcher/presentation/views/thank_you_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontSize: 18,
          ),
        ),
      ),
      home: const PaymentDetails(),
    );
  }
}
