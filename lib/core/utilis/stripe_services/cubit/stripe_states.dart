abstract class StripeStates {}

class StripeInitialState extends StripeStates {}
class FailerState extends StripeStates {
  String errorMassage ;
  FailerState({required this.errorMassage});
 
}

class ServerFailerState extends StripeStates {
  String errorMassage;
  ServerFailerState({required this.errorMassage});
}
class StripeLoadingState extends StripeStates {}
class StripeSucessState extends StripeStates {}
