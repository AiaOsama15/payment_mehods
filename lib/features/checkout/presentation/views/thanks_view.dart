import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/utils/styles.dart';
import '../../../../core/widgets/app_bar.dart';

class ThanksView extends StatelessWidget {
  const ThanksView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: SafeArea(
        child: Transform.translate(
          offset: const Offset(
            0,
            -16,
          ),
          child: Padding(
            padding: const EdgeInsets.all(
              25,
            ),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                const ThankYouCard(),
                Positioned(
                  bottom: MediaQuery.of(context).size.height * 0.2 + 20,
                  left: 20 + 16,
                  right: 20 + 16,
                  child: const DashedLine(),
                ),
                const HalfCircleShapeLeft(),
                const HalfCircleShapeRight(),
                const CheckIcon(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CheckIcon extends StatelessWidget {
  const CheckIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -50,
      left: 0,
      right: 0,
      child: CircleAvatar(
        radius: 50,
        backgroundColor: const Color(0xFFD9D9D9).withOpacity(0.3),
        child: const CircleAvatar(
          radius: 40,
          backgroundColor: Color(0xff34A853),
          child: Icon(
            Icons.check,
            size: 50,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class HalfCircleShapeRight extends StatelessWidget {
  const HalfCircleShapeRight({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: -20,
      bottom: MediaQuery.of(context).size.height * 0.2,
      child: const CircleAvatar(
        backgroundColor: Colors.white,
      ),
    );
  }
}

class HalfCircleShapeLeft extends StatelessWidget {
  const HalfCircleShapeLeft({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: -20,
      bottom: MediaQuery.of(context).size.height * 0.2,
      child: const CircleAvatar(
        backgroundColor: Colors.white,
      ),
    );
  }
}

class DashedLine extends StatelessWidget {
  const DashedLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        25,
        (index) => Expanded(
          child: Padding(
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 2),
            child: Container(
              color: const Color(
                0xFFB7B7B7,
              ),
              height: 3,
            ),
          ),
        ),
      ),
    );
  }
}

class ThankYouCard extends StatelessWidget {
  const ThankYouCard({
    super.key,
  });

  final List<String> info = const [
    "Date",
    "Time",
    "To",
  ];

  final List<String> data = const [
    "01/24/2023",
    "10:15 AM",
    "Sam Louis",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: ShapeDecoration(
        color: const Color(0xFFD9D9D9,).withOpacity(0.3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 50 + 16,
          left: 22,
          right: 22,
        ),
        child: Column(
          children: [
            Text(
              'Thank you!',
              style: Styles.style25,
            ),
            Text(
              'Your transaction was successful',
              style: Styles.style20,
            ),
            const SizedBox(
              height: 42,
            ),
            ...List.generate(
              info.length,
              (index) => Padding(
                padding: const EdgeInsetsDirectional.only(bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      info[index],
                      style: Styles.style18,
                    ),
                    Text(
                      data[index],
                      style: Styles.styleBold18,
                    ),
                  ],
                ),
              ),
            ),
            const Divider(
              color: Color(0xFFC6C6C6),
              thickness: 3,
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total",
                    style: Styles.style24,
                  ),
                  Text(
                    "\$ 50.97",
                    style: Styles.style24,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 55,
            ),
            const CardInfo(),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  FontAwesomeIcons.barcode,
                  size: 64,
                ),
                Container(
                  width: 113,
                  height: 58,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(width: 1.50, color: Color(0xFF34A853)),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'PAID',
                      style: Styles.styleGreen24,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height:
                  ((MediaQuery.of(context).size.height * 0.2 + 20) / 2) - 29,
            ),
          ],
        ),
      ),
    );
  }
}

class CardInfo extends StatelessWidget {
  const CardInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 305,
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 22, vertical: 16),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            "assets/images/master.svg",
          ),
          const SizedBox(
            width: 23,
          ),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Credit Card ',
                  style: Styles.style18,
                ),
                TextSpan(
                  text: 'Mastercard **78 ',
                  style: Styles.style16,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
