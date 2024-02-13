import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_gateway_new/core/utilis/stripe_services/cubit/stripe_states.dart';
import 'package:payment_gateway_new/core/utilis/stripe_services/data/models/payment_intent_input_model.dart';
import 'package:payment_gateway_new/core/utilis/stripe_services/stripe_services.dart';

class StripeCubit extends Cubit<StripeStates> {
  StripeCubit() : super(StripeInitialState());
  //call stripe3 methods
  stripePayment({required PaymentInputModel paymentInputModel}) async {
    try {
      emit(StripeLoadingState());
      print('StripeLoadingState');
      var data = await StripeServices()
          .makeFullPaymentSteps(paymentInputModel: paymentInputModel);
      emit(StripeSucessState());
      print('StripeServices is : $data');
    } catch (e) {
      emit(
        FailerState(
          errorMassage: e.toString(),
        ),
      );
      print('errorMassage is: $e');
    }
  }
}
