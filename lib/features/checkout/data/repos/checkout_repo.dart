import 'package:dartz/dartz.dart';
import 'package:payment_gateway_new/features/checkout/data/model/payment_intent_input.dart';

abstract class CheckoutRepo {
  Future<Either<Failure, void>> makePayment({
   required PaymentIntentInput paymentIntentInput,
});
}


abstract class Failure {
  final String errorMessage;

  Failure({required this.errorMessage});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errorMessage});

}