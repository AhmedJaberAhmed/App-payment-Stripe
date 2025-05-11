
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

 import 'ButtonHeroConsumer.dart';
import 'PaymentMethodsListView.dart';

class PaymentBottomSheet extends StatelessWidget {
  const PaymentBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 06,
          ),
          const PaymentMethodsListView(),
          const SizedBox(
            height: 32,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ButtonHeroConsumer(),
            ),
          )
        ],
      ),
    );
  }
}
