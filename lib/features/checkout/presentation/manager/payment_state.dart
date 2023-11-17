part of 'payment_cubit.dart';

class PaymentStates {}

class PaymentLoading extends PaymentStates {}

class PaymentSuccess extends PaymentStates {}

class PaymentFailed extends PaymentStates {
  final String errorMessage;

  PaymentFailed(this.errorMessage);
}
