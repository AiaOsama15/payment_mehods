import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_gateway_new/check_out_featcher/presentation/views/my_app.dart';
import 'package:payment_gateway_new/core/utilis/stripe_services/apis_secritkeys.dart';

void main() {
  Stripe.publishableKey = SecretKeys.publishableKey;
  // Stripe.publishableKey = stripePublishableKey;
  runApp(const MyApp());
}
