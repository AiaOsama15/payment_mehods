import 'package:dartz/dartz.dart';
import 'package:payment_gateway_new/core/utils/stripe_service.dart';
import 'package:payment_gateway_new/features/checkout/data/model/payment_intent_input.dart';
import 'package:payment_gateway_new/features/checkout/data/repos/checkout_repo.dart';

class CheckoutRepoImp extends CheckoutRepo {
  final StripeService stripeService = StripeService();

  @override
  Future<Either<Failure, void>> makePayment(
      {required PaymentIntentInput paymentIntentInput}) async {
    try {
      await stripeService.makePayment(
        paymentIntentInput: paymentIntentInput,
      );
      return right(
        null,
      );
    } catch (e) {
      return left(
        ServerFailure(
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
