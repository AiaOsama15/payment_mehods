import 'package:flutter/material.dart';

SizedBox buildDashline(BuildContext context) {
  return SizedBox(
    height: 3,
    width: MediaQuery.of(context).size.width,
    child: ListView.separated(
        scrollDirection: Axis.horizontal,
        // shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            color: Colors.black26,
            width: 10,
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            width: 6,
            height: 1,
          );
        },
        itemCount: 33),
  );
}
