class PaymentIntentModel {
  late final String id;
  late final String object;
  late final num amount;
  late final num amountCapturable;
  late final AmountDetails amountDetails;
  late final num amountReceived;
  late final void application;
  late final void applicationFeeAmount;
  late final AutomaticPaymentMethods automaticPaymentMethods;
  late final void canceledAt;
  late final void cancellationReason;
  late final String captureMethod;
  late final String clientSecret;
  late final String confirmationMethod;
  late final num created;
  late final String currency;
  late final void customer;
  late final String description;
  late final void invoice;
  late final void lastPaymentError;
  late final void latestCharge;
  late final bool livemode;
  late final Metadata metadata;
  late final void nextAction;
  late final void onBehalfOf;
  late final void paymentMethod;
  late final void paymentMethodConfigurationDetails;
  late final PaymentMethodOptions paymentMethodOptions;
  late final List<String> paymentMethodTypes;
  late final void processing;
  late final void receiptEmail;
  late final void review;
  late final void setupFutureUsage;
  late final void shipping;
  late final void statementDescriptor;
  late final void statementDescriptorSuffix;
  late final String status;
  late final void transferData;
  late final void transferGroup;

  PaymentIntentModel.fromJson(Map<String, dynamic> json){
    id = json['id'] ?? "";
    object = json['object'] ?? "";
    amount = json['amount'] ?? 0;
    amountCapturable = json['amount_capturable'] ?? 0;
    amountDetails = AmountDetails.fromJson(json['amount_details']);
    amountReceived = json['amount_received'] ?? 0;
    application = null;
    applicationFeeAmount = null;
    automaticPaymentMethods = AutomaticPaymentMethods.fromJson(json['automatic_payment_methods']);
    canceledAt = null;
    cancellationReason = null;
    captureMethod = json['capture_method'] ?? "";
    clientSecret = json['client_secret'] ?? "";
    confirmationMethod = json['confirmation_method'] ?? "";
    created = json['created'] ?? 0;
    currency = json['currency'] ?? "";
    customer = null;
    description = json['description'] ?? "";
    invoice = null;
    lastPaymentError = null;
    latestCharge = null;
    livemode = json['livemode'] ?? false;
    metadata = Metadata.fromJson(json['metadata']);
    nextAction = null;
    onBehalfOf = null;
    paymentMethod = null;
    paymentMethodConfigurationDetails = null;
    paymentMethodOptions = PaymentMethodOptions.fromJson(json['payment_method_options']);
    paymentMethodTypes = List.castFrom<dynamic, String>(json['payment_method_types']);
    processing = null;
    receiptEmail = null;
    review = null;
    setupFutureUsage = null;
    shipping = null;
    statementDescriptor = null;
    statementDescriptorSuffix = null;
    status = json['status'] ?? "";
    transferData = null;
    transferGroup = null;
  }
}

class AmountDetails {
  late final Tip tip;

  AmountDetails.fromJson(Map<String, dynamic> json){
    tip = Tip.fromJson(json['tip']);
  }
}

class Tip {
  Tip();
  Tip.fromJson(Map json);

}

class AutomaticPaymentMethods {
  late final bool enabled;

  AutomaticPaymentMethods.fromJson(Map<String, dynamic> json){
    enabled = json['enabled'] ?? false;
  }
}

class Metadata {
  Metadata();

  Metadata.fromJson(Map json);

}

class PaymentMethodOptions {
  late final Card card;

  PaymentMethodOptions.fromJson(Map<String, dynamic> json){
    card = Card.fromJson(json['card']);
  }
}

class Card {
  late final void installments;
  late final void mandateOptions;
  late final void network;
  late final String requestThreeDSecure;

  Card.fromJson(Map<String, dynamic> json){
    installments = null;
    mandateOptions = null;
    network = null;
    requestThreeDSecure = json['request_three_d_secure'] ?? "";
  }
}