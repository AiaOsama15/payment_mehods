
import 'package:flutter/material.dart';
import 'package:payment_gateway_new/check_out_featcher/presentation/widgets/thank_you_body.dart';

class ThankYouView extends StatelessWidget {
  const ThankYouView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(30.0),
          child: AppBar(
            leading: const Icon(
              Icons.arrow_back,
              size: 40,
            ),
          ),
        ),
        body: const ThankYouViewBody(),
      ),
    );
  }
}
