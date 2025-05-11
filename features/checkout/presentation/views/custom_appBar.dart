import 'package:flutter/material.dart';

import '../../../../core/utils/text_style.dart';


AppBar appBarr({required final String title}) {
  return AppBar(
    leading: Icon(
      size: 40,
      Icons.arrow_back,
      color: Colors.black,
    ),
    backgroundColor: Colors.transparent,
    elevation: 0,
    centerTitle: true,
    title: Text(
        textAlign: TextAlign.center, title, style: Styles.textStyle25),
  );
}