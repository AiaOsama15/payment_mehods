class PaymentIntentInput
{
  final String amount, currency, customerId;

  PaymentIntentInput({required this.amount, required this.currency, required this.customerId});

  toJson() {
    return {
      "amount" : "${amount}00",
      "currency" : currency,
      "customer" : customerId,
    };
  }
}