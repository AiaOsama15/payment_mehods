import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_gateway_new/core/utils/api_keys.dart';
import 'package:payment_gateway_new/core/utils/api_service.dart';
import 'package:payment_gateway_new/features/checkout/data/model/ephemeral_key.dart';
import 'package:payment_gateway_new/features/checkout/data/model/init_paymentsheet_input.dart';
import 'package:payment_gateway_new/features/checkout/data/model/payment_intent_input.dart';

import '../../features/checkout/data/model/payment_intent.dart';

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

  Future initPaymentSheet(
      {required InitPaymentSheetInputModel initPaymentSheetInputModel}) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: initPaymentSheetInputModel.clientSecret,
        customerEphemeralKeySecret:
            initPaymentSheetInputModel.ephemeralKeySecret,
        customerId: initPaymentSheetInputModel.customerId,
        merchantDisplayName: "ahmed",
      ),
    );
  }

  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future makePayment({required PaymentIntentInput paymentIntentInput}) async {
    var paymentIntentModel = await createPaymentIntent(
      paymentIntentInput,
    );
    var ephemeralKeyModel = await createEphemeralKey(
      customerId: paymentIntentInput.customerId,
    );
    var initPaymentSheetInputModel = InitPaymentSheetInputModel(
      clientSecret: paymentIntentModel.clientSecret,
      customerId: paymentIntentInput.customerId,
      ephemeralKeySecret: ephemeralKeyModel.secret,
    );

    await initPaymentSheet(
      initPaymentSheetInputModel: initPaymentSheetInputModel,
    );
    await displayPaymentSheet();
  }

  Future<EphemeralKeyModel> createEphemeralKey(
      {required String customerId}) async {
    var response = await apiService.post(
      body: {
        "customer": customerId,
      },
      contentType: Headers.formUrlEncodedContentType,
      url: "https://api.stripe.com/v1/ephemeral_keys",
      token: ApiKeys.secretKey,
      headers: {
        "Authorization": "Bearer ${ApiKeys.secretKey}",
        "Stripe-Version": "2023-10-16",
      },
    );
    var ephemeralKey = EphemeralKeyModel.fromJson(response.data);
    return ephemeralKey;
  }
}
