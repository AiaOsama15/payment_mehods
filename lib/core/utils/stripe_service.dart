import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_gateway_new/core/utils/api_keys.dart';
import 'package:payment_gateway_new/core/utils/api_service.dart';
import 'package:payment_gateway_new/features/checkout/data/model/payment_intent_input.dart';

import '../../features/checkout/data/model/payment_intent_model.dart';

class StripeService {
  final ApiService apiService = ApiService();

  Future<PaymentIntentModel> createPaymentIntent(
      PaymentIntentInput paymentIntentInput) async {
    var response = await apiService.post(
      body: paymentIntentInput.toJson(),
      url: "https://api.stripe.com/v1/payment_intents",
      token: ApiKeys.secretKey,
      contentType: Headers.formUrlEncodedContentType,
    );

    var paymentIntentModel = PaymentIntentModel.fromJson(response.data);
    return paymentIntentModel;
  }

  Future initPaymentSheet({required String paymentIntentClientSecret}) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: paymentIntentClientSecret,
        merchantDisplayName: "ahmed",
      ),
    );
  }

  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future makePayment({required PaymentIntentInput paymentIntentInput}) async {
    var paymentIntentModel = await createPaymentIntent(paymentIntentInput);
    await initPaymentSheet(
      paymentIntentClientSecret: paymentIntentModel.clientSecret,
    );
    await displayPaymentSheet();
  }
}
