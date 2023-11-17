import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

import '../../../../core/utils/styles.dart';
import '../../../../core/widgets/app_bar.dart';
import '../../../../core/widgets/payment_method_item.dart';
import 'thanks_view.dart';

class PaymentDetailsView extends StatefulWidget {
  const PaymentDetailsView({super.key});

  @override
  State<PaymentDetailsView> createState() => _PaymentDetailsViewState();
}

class _PaymentDetailsViewState extends State<PaymentDetailsView> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        title: 'Payment Details',
      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const SliverToBoxAdapter(
            child: PaymentMethods(),
          ),
          SliverToBoxAdapter(
            child: CustomCreditCard(
              formKey: formKey,
              autovalidateMode: autovalidateMode,
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Align(
              alignment: AlignmentDirectional.bottomCenter,
              child: GestureDetector(
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    log("payment");
                  } else {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const ThanksView(),
                      ),
                    );
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
                child: Container(
                  width: double.infinity,
                  height: 60,
                  margin: const EdgeInsetsDirectional.only(
                      bottom: 16, start: 16, end: 16, top: 16),
                  decoration: ShapeDecoration(
                    color: const Color(
                      0xFF34A853,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Pay',
                      style: Styles.style22,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CustomCreditCard extends StatefulWidget {
  const CustomCreditCard(
      {super.key, required this.formKey, required this.autovalidateMode});

  final GlobalKey<FormState> formKey;
  final AutovalidateMode autovalidateMode;

  @override
  State<CustomCreditCard> createState() => _CustomCreditCardState();
}

class _CustomCreditCardState extends State<CustomCreditCard> {
  String cardNumber = "", expiryDate = "", cardHolderName = "", cvvCode = "";

  bool showBackView = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CreditCardWidget(
          cardNumber: cardNumber,
          expiryDate: expiryDate,
          cardHolderName: cardHolderName,
          cvvCode: cvvCode,
          showBackView: showBackView,
          onCreditCardWidgetChange: (value) {},
          isHolderNameVisible: true,
        ),
        CreditCardForm(
          cardNumber: cardNumber,
          expiryDate: expiryDate,
          cardHolderName: cardHolderName,
          cvvCode: cvvCode,
          onCreditCardModelChange: (creditCardModel) {
            cardHolderName = creditCardModel.cardHolderName;
            expiryDate = creditCardModel.expiryDate;
            cvvCode = creditCardModel.cvvCode;
            cardNumber = creditCardModel.cardNumber;
            showBackView = creditCardModel.isCvvFocused;
            setState(() {});
          },
          formKey: widget.formKey,
          autovalidateMode: widget.autovalidateMode,
        ),
      ],
    );
  }
}

class PaymentMethods extends StatefulWidget {
  const PaymentMethods({super.key});

  @override
  State<PaymentMethods> createState() => _PaymentMethodsState();
}

class _PaymentMethodsState extends State<PaymentMethods> {
  final List<String> paymentMethodsItems = const [
    "card.svg",
    "paypal.svg",
  ];

  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 62,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: paymentMethodsItems.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 16),
          child: GestureDetector(
            onTap: () {
              activeIndex = index;
              setState(() {});
            },
            child: PaymentMethodItem(
              isActive: activeIndex == index,
              imageName: paymentMethodsItems[index],
            ),
          ),
        ),
      ),
    );
  }
}
