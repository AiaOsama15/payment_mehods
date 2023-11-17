import 'package:flutter/material.dart';

import '../utils/styles.dart';

AppBar buildAppBar({final String? title}) {
  return AppBar(
    centerTitle: true,
    backgroundColor: Colors.transparent,
    elevation: 0,
    leading: const Icon(
      Icons.arrow_back_ios,
      color: Colors.black,
      size: 30,
    ),
    title: Text(
      title ?? "",
      style: Styles.style25,
    ),
  );
}
