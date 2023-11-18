class InitPaymentSheetInputModel {
  late final String clientSecret, customerId, ephemeralKeySecret;

  InitPaymentSheetInputModel({
    required this.clientSecret,
    required this.customerId,
    required this.ephemeralKeySecret,
  });
}
