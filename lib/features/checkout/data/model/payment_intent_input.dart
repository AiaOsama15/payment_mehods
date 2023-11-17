class PaymentIntentInput
{
  final String amount, currency;

  PaymentIntentInput({required this.amount, required this.currency});

  toJson() {
    return {
      "amount" : "${amount}00",
      "currency" : currency,
    };
  }
}