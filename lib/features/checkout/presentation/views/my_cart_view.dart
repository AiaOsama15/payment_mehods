import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_gateway_new/features/checkout/data/model/payment_intent_input.dart';
import 'package:payment_gateway_new/features/checkout/data/repos/checkout_repo_impl.dart';
import 'package:payment_gateway_new/features/checkout/presentation/manager/payment_cubit.dart';
import 'package:payment_gateway_new/features/checkout/presentation/views/thanks_view.dart';

import '../../../../core/utils/styles.dart';
import '../../../../core/widgets/app_bar.dart';
import 'payment_details.dart';

class MyCart extends StatelessWidget {
  const MyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        title: 'My Cart',
      ),
      body: Padding(
        padding: const EdgeInsetsDirectional.symmetric(
          horizontal: 20,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 18,
            ),
            Expanded(
              child: Image.asset(
                "assets/images/basket.png",
                width: 272,
                height: 424,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            const OrderInfoItem(
              title: 'Order Subtotal',
              value: '\$ 42.97',
            ),
            const SizedBox(
              height: 3,
            ),
            const OrderInfoItem(
              title: 'Discount',
              value: '\$ 0',
            ),
            const SizedBox(
              height: 3,
            ),
            const OrderInfoItem(
              title: 'Shipping',
              value: '\$ 8',
            ),
            const SizedBox(
              height: 17,
            ),
            const Divider(
              thickness: 2,
              indent: 20,
              endIndent: 20,
              color: Color(
                0xffC7C7C7,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const TotalPrice(
              title: 'Total',
              value: '\$ 50.97',
            ),
            const SizedBox(
              height: 16,
            ),
            GestureDetector(
              onTap: () {
                // Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: (context) => PaymentDetailsView(),
                //   ),
                // );

                showModalBottomSheet(
                  context: context,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusDirectional.circular(
                      15,
                    ),
                  ),
                  builder: (context) {
                    return BlocProvider(
                      create: (context) => PaymentCubit(CheckoutRepoImp()),
                      child: const PaymentMethodsBottomSheet(),
                    );
                  },
                );
              },
              child: Container(
                width: double.infinity,
                height: 60,
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
                    'Complete Payment',
                    style: Styles.style22,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
          ],
        ),
      ),
    );
  }
}

class OrderInfoItem extends StatelessWidget {
  const OrderInfoItem({super.key, required this.title, required this.value});

  final String title, value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: Styles.style18,
        ),
        const Spacer(),
        Text(
          value,
          style: Styles.style18,
        ),
      ],
    );
  }
}

class TotalPrice extends StatelessWidget {
  const TotalPrice({super.key, required this.title, required this.value});

  final String title, value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: Styles.style24,
        ),
        const Spacer(),
        Text(
          value,
          style: Styles.style24,
        ),
      ],
    );
  }
}

class PaymentMethodsBottomSheet extends StatelessWidget {
  const PaymentMethodsBottomSheet({super.key, this.isLoading = false});

  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 16,
          ),
          const PaymentMethods(),
          const SizedBox(
            height: 30,
          ),
          BlocConsumer<PaymentCubit, PaymentStates>(
            listener: (context, state) {
              if (state is PaymentSuccess) {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const ThanksView(),
                  ),
                );
              }
              if (state is PaymentFailed) {
                Navigator.pop(context);
                SnackBar snackBar = SnackBar(
                  content: Text(
                    state.errorMessage,
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  snackBar,
                );
              }
            },
            builder: (context, state) {
              if (state is PaymentLoading) {
                return const CircularProgressIndicator();
              } else {
                return GestureDetector(
                  onTap: () {
                    PaymentIntentInput paymentIntentInput = PaymentIntentInput(
                      amount: "100",
                      currency: "usd",
                    );
                    BlocProvider.of<PaymentCubit>(context).makePayment(
                      paymentIntentInput: paymentIntentInput,
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    height: 60,
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
                        'Continue',
                        style: Styles.style22,
                      ),
                    ),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
