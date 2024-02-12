class PaymentInputModel {
   String amount;
  String currency;
  PaymentInputModel({required this.amount, required this.currency});

 toJison() {
    return {'amount': amount, 'currency': currency};
  }
}
