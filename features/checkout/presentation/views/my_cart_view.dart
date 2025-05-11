import 'package:flutter/material.dart';

import 'MyCartViewBody.dart';
import 'custom_appBar.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarr(title: "My Cart "),
      body: MyCartViewBody(),
    );
  }


}