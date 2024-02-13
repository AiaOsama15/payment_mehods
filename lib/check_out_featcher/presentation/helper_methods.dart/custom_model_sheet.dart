import 'package:flutter/material.dart';
import 'package:payment_gateway_new/check_out_featcher/presentation/widgets/build_image_container.dart';
import 'package:payment_gateway_new/check_out_featcher/presentation/widgets/custom_elevated_button.dart';
import 'package:payment_gateway_new/core/utilis/constant.dart';
import 'package:payment_gateway_new/core/utilis/stripe_services/cubit/stripe_cubit.dart';
import 'package:payment_gateway_new/core/utilis/stripe_services/data/models/payment_intent_input_model.dart';

customButtomSheetPaymentDetails(BuildContext context) {
  return showModalBottomSheet(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(0.0)),
    ),
    context: context,
    builder: (BuildContext context) {
      return Padding(
        padding: const EdgeInsets.only(left: 15, top: 10),
        child: SizedBox(
          height: 200,
          child: Column(
            children: [
              vhSizeBox,
              const PaymentItemsDetails(),
              vhSizeBox,
              vhSizeBox,
              SizedBox(
                width: 200,
                child: CustomElevateButton(
                    textOfButton: 'Pay',
                    onPressed: () {
                      //active stripe
                      PaymentInputModel paymentInputModel =
                          PaymentInputModel(currency: 'USA', amount: '100');
                      StripeCubit()
                          .stripePayment(paymentInputModel: paymentInputModel);
                    }),
              ),
            ],
          ),
        ),
      );
    },
  );
}
