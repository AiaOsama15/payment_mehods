
import 'package:flutter/material.dart';
import 'package:payment_gateway_new/check_out_featcher/presentation/helper_methods.dart/build_dash_line.dart';
import 'package:payment_gateway_new/check_out_featcher/presentation/helper_methods.dart/build_green_check.dart';
import 'package:payment_gateway_new/check_out_featcher/presentation/widgets/custom_recete.dart';

var geryColor = 0xFFEDEDED;

// ignore: must_be_immutable
class ThankYouViewBody extends StatelessWidget {
  const ThankYouViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 40),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 244, 241, 241),
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: const Padding(
              padding: EdgeInsets.only(top: 50, left: 15, right: 15),
              child: CustomRecete(),
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.2 - 30,
            left: -20,
            child: const CircleAvatar(
              backgroundColor: Colors.white,
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.2 - 30,
            right: -20,
            child: const CircleAvatar(
              backgroundColor: Colors.white,
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: -50,
            child: buildGreenCheck(),
          ),
          //line
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.2 - 10,
            left: 20,
            right: 20,
            child: buildDashline(context),
          ),
        ],
      ),
    );
  }
}
