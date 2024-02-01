
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:payment_gateway_new/check_out_featcher/presentation/helper_methods.dart/build_spacer.dart';
import 'package:payment_gateway_new/check_out_featcher/presentation/helper_methods.dart/build_text_row.dart';
import 'package:payment_gateway_new/check_out_featcher/presentation/widgets/custom_container_credit.dart';
import 'package:payment_gateway_new/check_out_featcher/presentation/widgets/custom_qr_row.dart';
import 'package:payment_gateway_new/core/utilis/constant.dart';
import 'package:payment_gateway_new/core/utilis/style.dart';

class CustomRecete extends StatelessWidget {
  const CustomRecete({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text(
          'Thank you!',
          style: Style.textStyle25,
        ),
        const SizedBox(
          height: 4,
        ),
        const Text(
          ' Your transaction was successful ',
          style: Style.textStyle20,
        ),
        vhSizeBox,
        vhSizeBox,
        vhSizeBox,
        customTextRow('Date', Style.textStyle18bold, '01/24/2023'),
        vhSizeBox,
        hSizeBox,
        customTextRow('Time', Style.textStyle18bold, '10:15 AM'),
        vhSizeBox,
        hSizeBox,
        customTextRow('To', Style.textStyle18bold, 'Sam Louis'),
        vhSizeBox,
        hSizeBox,
        vhSizeBox,
        buildSpacer(),
        vhSizeBox,
        vhSizeBox,
        customTextRow('Total ', Style.textStyle25, '\$50.97'),
        vhSizeBox, vhSizeBox,
        //card container
        const CustomContainerCredit(), vhSizeBox,
        const Spacer(),
        Positioned(
            bottom: MediaQuery.of(context).size.height * 0.1,
            child: const CustomQrRow()),
        const Spacer(),
      ],
    );
  }
}
