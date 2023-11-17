import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_gateway_new/features/checkout/data/model/payment_intent_input.dart';
import 'package:payment_gateway_new/features/checkout/data/repos/checkout_repo.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentStates> {
  PaymentCubit(this.checkoutRepo) : super(PaymentStates());
  final CheckoutRepo checkoutRepo;

  Future makePayment({required PaymentIntentInput paymentIntentInput}) async {
    emit(
      PaymentLoading(),
    );

    var data = await checkoutRepo.makePayment(
      paymentIntentInput: paymentIntentInput,
    );

    data.fold(
      (l) => emit(PaymentFailed(l.errorMessage)),
      (r) => emit(
        PaymentSuccess(),
      ),
    );
  }

  @override
  void onChange(Change<PaymentStates> change) {
    log(
      change.toString(),
    );
    super.onChange(change);
  }
}
