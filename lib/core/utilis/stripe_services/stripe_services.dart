import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_gateway_new/core/utilis/stripe_services/apis_secritkeys.dart';
import 'package:payment_gateway_new/core/utilis/stripe_services/apis_services.dart';
import 'package:payment_gateway_new/core/utilis/stripe_services/data/models/payment_intent_input_model.dart';
import 'package:payment_gateway_new/core/utilis/stripe_services/data/models/payment_intent_output_model.dart';

class StripeServices {
  ApisServices apisServicesObj = ApisServices();

  Future<OutputPaymentIntentModel> createPaymentMethod(
      {required PaymentInputModel paymentInputModel}) async {
    Response response = await apisServicesObj.post(
        url: 'https://api.stripe.com/v1/payment_intents',
        token: SecretKeys.secretKey,
        contentType: Headers.contentEncodingHeader,
        data: paymentInputModel.toJison());
    var paymentReturnRes = OutputPaymentIntentModel.fromJson(response.data);
    return paymentReturnRes;
  }

  Future<void> initPaymentSheet({String? paymentIntentClientSecret}) async {
    // 1. create payment intent on the server

    // 2. initialize the payment sheet
    await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
      // Set to true for custom flow
      customFlow: false,
      // Main params
      merchantDisplayName: 'Flutter Stripe by ayaOsama',
      paymentIntentClientSecret: paymentIntentClientSecret,
    ));
  }

  displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future makeFullPaymentSteps(
      {required PaymentInputModel paymentInputModel}) async {
    //call 3 methods in stripe
    var paymentIntentOutputModel =
        await createPaymentMethod(paymentInputModel: paymentInputModel);
    await initPaymentSheet(
        paymentIntentClientSecret: paymentIntentOutputModel.clientSecret);
    await displayPaymentSheet();
  }
}
