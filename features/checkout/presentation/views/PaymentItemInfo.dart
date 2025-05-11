
import 'package:flutter/cupertino.dart';

import '../../../../core/utils/text_style.dart';


class PaymentItemInfo extends StatelessWidget {
  const PaymentItemInfo({super.key, required this.title, required this.value});

  final String title, value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Styles.textStyle18,
          ),
          Text(
            value,
            style: Styles.textStyleBold18,
          )
        ],
      ),
    );
  }
}
