import 'package:flutter/material.dart';
import 'package:payment_gateway_new/check_out_featcher/presentation/views/payment_details.dart';
import 'package:payment_gateway_new/check_out_featcher/presentation/widgets/build_image_container.dart';
import 'package:payment_gateway_new/check_out_featcher/presentation/widgets/custom_elevated_button.dart';
import 'package:payment_gateway_new/core/utilis/constant.dart';

class CustomButtomSheetPaymentDetails extends StatelessWidget {
  const CustomButtomSheetPaymentDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: customButtomSheetPaymentDetails(context),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          return customButtomSheetPaymentDetails(context);
        });
  }

  customButtomSheetPaymentDetails(BuildContext context) {
    return showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(0.0)),
      ),
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 200,
          child: Column(
            children: [
              vhSizeBox,
              const PaymentItemsDetails(),
              vhSizeBox,
              vhSizeBox,
              SizedBox(
                width: 200,
                child:
                    CustomElevateButton(textOfButton: 'Pay', onPressed: () {}),
              ),
            ],
          ),
        );
      },
    );
  }
}
