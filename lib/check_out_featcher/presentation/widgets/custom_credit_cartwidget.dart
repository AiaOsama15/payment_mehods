// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:payment_gateway_new/core/utilis/constant.dart';

// ignore: must_be_immutable
class CustomCreditCardWidget extends StatefulWidget {
  String cardNumber = '';
  String cardHolderName = '';

  String expiryDate = '';

  String cvvCode = '';
  bool showBackView = false;

  CustomCreditCardWidget({
    super.key,
  });

  @override
  State<CustomCreditCardWidget> createState() => _CustomCreditCardWidgetState();
}

class _CustomCreditCardWidgetState extends State<CustomCreditCardWidget> {
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CreditCardWidget(
          cardNumber: widget.cardNumber,
          expiryDate: widget.expiryDate,
          cardHolderName: widget.cardHolderName,
          cvvCode: widget.cvvCode,
          showBackView: widget.showBackView,
          isHolderNameVisible: true,
          //true when you want to show cvv(back) view
          onCreditCardWidgetChange: (CreditCardBrand
              brand) {}, // Callback for anytime credit card brand is changed
        ),
        hSizeBox,
        CreditCardForm(
          formKey: formKey, // Required
          cardNumber: widget.cardNumber, // Required
          expiryDate: widget.expiryDate, // Required
          cardHolderName: widget.cardHolderName, // Required
          cvvCode: widget.cvvCode,
          // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
          onCreditCardModelChange: (CreditCardModel) {
            widget.cardHolderName = CreditCardModel.cardHolderName;
            widget.cardNumber = CreditCardModel.cardNumber;
            widget.cvvCode = CreditCardModel.cvvCode;
            widget.expiryDate = CreditCardModel.expiryDate;
            widget.showBackView = CreditCardModel.isCvvFocused;
            setState(() {});
          }, // Required
          // cardNumberKey: cardNumberKey,
          // cvvCodeKey: widget.cvvCode,
          // expiryDateKey: expiryDateKey,
          // cardHolderKey: cardHolderKey,
        ),
      ],
    );
  }
}
