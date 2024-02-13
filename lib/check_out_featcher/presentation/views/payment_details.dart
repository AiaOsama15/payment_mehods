import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_gateway_new/check_out_featcher/presentation/helper_methods.dart/build_app_bar.dart';
import 'package:payment_gateway_new/check_out_featcher/presentation/helper_methods.dart/custom_model_sheet.dart';
import 'package:payment_gateway_new/check_out_featcher/presentation/widgets/build_image_container.dart';
import 'package:payment_gateway_new/check_out_featcher/presentation/widgets/custom_buttom_sheet_paymentdetails.dart';
import 'package:payment_gateway_new/check_out_featcher/presentation/widgets/custom_container_credit.dart';
import 'package:payment_gateway_new/check_out_featcher/presentation/widgets/custom_credit_cartwidget.dart';
import 'package:payment_gateway_new/check_out_featcher/presentation/widgets/custom_elevated_button.dart';
import 'package:payment_gateway_new/core/utilis/constant.dart';
import 'package:payment_gateway_new/core/utilis/stripe_services/cubit/stripe_cubit.dart';
import 'package:payment_gateway_new/core/utilis/stripe_services/cubit/stripe_states.dart';

class PaymentDetails extends StatefulWidget {
  const PaymentDetails({super.key});

  @override
  State<PaymentDetails> createState() => _PaymentDetailsState();
}

class _PaymentDetailsState extends State<PaymentDetails> {
  bool isActive = false;
  // bool isActive2 = false;
  // bool isActive3 = false;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StripeCubit(),
      child: BlocConsumer<StripeCubit, StripeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: customAppBar('Payment Details', () {}),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const PaymentItemsDetails(),
                    vhSizeBox,
                    CustomCreditCardWidget(),
                    // const CustomContainerCredit()
                    vhSizeBox,
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        children: [
                          Expanded(
                            child: CustomElevateButton(
                              textOfButton: 'Pay',
                              onPressed: () {
                                customButtomSheetPaymentDetails(context);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
