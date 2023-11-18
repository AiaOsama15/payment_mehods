import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:payment_gateway_new/core/utils/api_keys.dart';
import 'package:payment_gateway_new/features/checkout/data/model/amount_model.dart';
import 'package:payment_gateway_new/features/checkout/data/model/details.dart';
import 'package:payment_gateway_new/features/checkout/data/model/item.dart';
import 'package:payment_gateway_new/features/checkout/data/model/items_list_model.dart';
import 'package:payment_gateway_new/features/checkout/data/model/payment_intent_input.dart';
import 'package:payment_gateway_new/features/checkout/data/repos/checkout_repo_impl.dart';
import 'package:payment_gateway_new/features/checkout/presentation/manager/payment_cubit.dart';
import 'package:payment_gateway_new/features/checkout/presentation/views/thanks_view.dart';

import '../../../../core/utils/styles.dart';
import '../../../../core/widgets/app_bar.dart';
import 'payment_details.dart';

class MyCart extends StatelessWidget {
  MyCart({super.key});

  final List<String> orderInfo = [
    "Order Subtotal",
    "Discount",
    "Shipping",
  ];

  final List<String> orderData = [
    "\$ 42.97",
    "\$ 0",
    "\$ 8",
  ];

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
            ListView.separated(
              itemBuilder: (context, index) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    orderInfo[index],
                    style: Styles.style18,
                  ),
                  Text(
                    orderData[index],
                    style: Styles.style18,
                  ),
                ],
              ),
              separatorBuilder: (context, index) => const SizedBox(
                height: 10,
              ),
              itemCount: orderInfo.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
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
                    // PaymentIntentInput paymentIntentInput = PaymentIntentInput(
                    //   amount: "100",
                    //   currency: "usd",
                    //   customerId: "cus_P1r3odudAIcxPn",
                    // );
                    // BlocProvider.of<PaymentCubit>(context).makePayment(
                    //   paymentIntentInput: paymentIntentInput,
                    // );

                    var transactionsData = getTransactions();

                    executePaypalPayment(context, transactionsData);
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

  void executePaypalPayment(BuildContext context, ({AmountModel amount, ItemListModel itemList}) transactionsData) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => PaypalCheckoutView(
          sandboxMode: true,
          clientId: ApiKeys.clientId,
          secretKey: ApiKeys.paypalSecretKey,
          transactions: [
            {
              "amount": transactionsData.amount.toJson(),
              "description":
                  "The payment transaction description.",
              "item_list": transactionsData.itemList.toJson(),
            }
          ],
          note: "Contact us for any questions on your order.",
          onSuccess: (Map params) async {
            log("onSuccess: $params");
            Navigator.pop(context);
          },
          onError: (error) {
            log("onError: $error");
            Navigator.pop(context);
          },
          onCancel: () {
            print('cancelled:');
            Navigator.pop(context);
          },
        ),
      ),
    );
  }

  ({AmountModel amount, ItemListModel itemList}) getTransactions() {
    var amount = AmountModel(
      total: "100",
      currency: "USD",
      details: Details(
        shipping: "0",
        shippingDiscount: 0,
        subtotal: "100",
      ),
    );

    List<OrderItemModel> orders = [
      OrderItemModel(
        currency: "USD",
        name: "Apple",
        price: "4",
        quantity: 10,
      ),
      OrderItemModel(
        currency: "USD",
        name: "Apple",
        price: "5",
        quantity: 12,
      ),
    ];

    var itemList = ItemListModel(orders: orders);

    return (amount: amount, itemList: itemList);
  }
}
